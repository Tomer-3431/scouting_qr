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

SCOPES = ["https://www.googleapis.com/auth/spreadsheets"]

SAMPLE_SPREADSHEET_ID = "1AY_-V0ARO47pqvl9GkZwr9pHLo9MLFsO1Ipqyizyqik"
SAMPLE_RANGE_NAME = "Sheets1!A:C"

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

cap = cv.VideoCapture(0)
cap.set(cv.CAP_PROP_FRAME_WIDTH, 1280)
cap.set(cv.CAP_PROP_FRAME_HEIGHT, 720)

seenBarcodes = []
unsendBarcodes = []


def checkConnection():
    respones = requests.get("https://www.google.com", timeout=5)


def sendToGoogleSheet(data: list[list[str]]) -> str:
    requestBody = {
        "majorDimension": "ROWS",
        "values": data,
    }
    result = (
        service.spreadsheets()
        .values()
        .append(
            spreadsheetId=SAMPLE_SPREADSHEET_ID,
            range=SAMPLE_RANGE_NAME,
            valueInputOption="USER_ENTERED",
            body=requestBody,
        )
        .execute()
    )
    return result


def writeToFile(barcode: str) -> None:
    f = open("qrReader/scoutingInfo.txt", "a")
    f.write(barcode + "\n")
    f.close()


while True:
    ret, frame = cap.read()

    if len(unsendBarcodes) > 0:
        try:
            checkConnection()
            result = sendToGoogleSheet(unsendBarcodes)
            print(
                "send unsended tags and saved on: " + result["updates"]["updatedRange"]
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
                    print("saved on: " + result["updates"]["updatedRange"])
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
                myData,
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
