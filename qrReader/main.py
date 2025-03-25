import cv2 as cv
import numpy as np
from pyzbar.pyzbar import decode

import os.path
from google.auth.transport.requests import Request
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build
from googleapiclient.errors import HttpError

import requests
''
SCOPES = ["https://www.googleapis.com/auth/spreadsheets"]

DEMACIA_SPREADSHEET_ID = "1hyFnvzltVvY20OpxuQe5-nzW-l-8aGyxYo-S9qrIfVk"
PHEONIX_SPREADSHEET_ID = "1PdokcWuBU_6Vf5UT-Ldwnld9Y_3Hs2qWxCnOTBcAXKU"
CYPHER_SPREADSHEET_ID = "1vasKJvJ1lqDt4DbjbkLWtZvKrdMK6mGUg8JePbcdkHA"
SAMPLE_RANGE_NAME = "TomerData!A:C"

creds = None

if os.path.exists("qrReader/token.json"):
    creds = Credentials.from_authorized_user_file("qrReader/token.json", SCOPES)

if not creds or not creds.valid:
    if creds and creds.expired and creds.refresh_token:
        creds.refresh(Request())
    else:
        flow = InstalledAppFlow.from_client_secrets_file(
            "qrReader/credentials.json", SCOPES
        )
        creds = flow.run_local_server(port=0)

    with open("qrReader/token.json", "w") as token:
        token.write(creds.to_json())

service = build("sheets", "v4", credentials=creds)

cap = cv.VideoCapture(1)
cap.set(cv.CAP_PROP_FRAME_WIDTH, 1280)
cap.set(cv.CAP_PROP_FRAME_HEIGHT, 720)

seenBarcodes = []
unsendBarcodes = []


def checkConnection():
    respones = requests.get("https://www.google.com", timeout=5)


def sendToGoogleSheet(data: list[list[str]]) -> str:
    savedOnRange: str = ""
    
    requestBody = {
        "majorDimension": "ROWS",
        "values": data,
    }
    result = (
        service.spreadsheets()
        .values()
        .append(
            spreadsheetId=DEMACIA_SPREADSHEET_ID,
            range=SAMPLE_RANGE_NAME,
            valueInputOption="USER_ENTERED",
            body=requestBody,
        )
        .execute()
    )
    
    savedOnRange += "Saved on: " + result["updates"]["updatedRange"] + "at Demacia\n"
    
    requestBody = {
        "majorDimension": "ROWS",
        "values": data,
    }
    result = (
        service.spreadsheets()
        .values()
        .append(
            spreadsheetId=PHEONIX_SPREADSHEET_ID,
            range=SAMPLE_RANGE_NAME,
            valueInputOption="USER_ENTERED",
            body=requestBody,
        )
        .execute()
    )
    
    savedOnRange += "Saved on: " + result["updates"]["updatedRange"] + "at Pheonix\n"

    requestBody = {
        "majorDimension": "ROWS",
        "values": data,
    }
    result = (
        service.spreadsheets()
        .values()
        .append(
            spreadsheetId=CYPHER_SPREADSHEET_ID,
            range=SAMPLE_RANGE_NAME,
            valueInputOption="USER_ENTERED",
            body=requestBody,
        )
        .execute()
    )
    
    savedOnRange += "Saved on: " + result["updates"]["updatedRange"] + "At Cypher\n"
    
    return savedOnRange


def writeToFile(barcode: str) -> None:
    with open("qrReader/scoutingInfo.txt", 'a') as f:
        f.write(barcode + "\n")

def process(frame):
    frame = cv.cvtColor(frame, cv.COLOR_BGR2GRAY)    
    y = int(1280 * 0.1)
    x = int(720 * 0.1)
    w = 720 - x
    h = 1280 - y
    frame = frame[y:y+h, x:x+w]
    blur = cv.GaussianBlur(frame,(3,3),0)
    ret3,th3 = cv.threshold(blur,0,255,cv.THRESH_BINARY+cv.THRESH_OTSU)
    return th3

while True:
    ret, frame = cap.read()
    frame = process(frame)

    if len(unsendBarcodes) > 0:
        try:
            checkConnection()
            result = sendToGoogleSheet(unsendBarcodes)
            print(
                "Sended unsended tags and\n" + result
            )
            unsendBarcodes = []

        except requests.ConnectionError as e:
            print("wait for " + len(unsendBarcodes) + "to be send")

        except HttpError as e:
            print(e)

    try:
        for barcode in decode(frame):
            myData: str = barcode.data.decode("utf-8")
            splitData: list[str] = myData.split(",")
            print(myData)

            try:
                if (splitData[-1] not in seenBarcodes) and (len(splitData) > 2):
                    writeToFile(myData)
                    checkConnection()
                    result = sendToGoogleSheet([splitData[2:]])
                    print("Saved on: " + result)
                    seenBarcodes.append(splitData[-1])

            except requests.ConnectionError as e:
                print("no connction")
                unsendBarcodes.append(splitData[2:])
                seenBarcodes.append(splitData[-1])

            except HttpError as e:
                print(e)

            pts = np.array([barcode.polygon], np.int32)
            cv.polylines(frame, [pts], True, (255, 0, 0), 5)
            pts2 = barcode.rect
            cv.putText(
                frame,
                splitData[-1],
                (pts2[0], pts2[1]),
                cv.FONT_HERSHEY_COMPLEX,
                1,
                (255, 0, 0),
                2,
            )
    except Exception as e:
        print(e)

    cv.imshow("In", frame)
    if cv.waitKey(1) & 0xFF == ord("q"):
        break
