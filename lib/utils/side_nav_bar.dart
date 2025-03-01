import 'package:flutter/material.dart';
import 'package:scouting_qr/form/details_form.dart';

class SideNavBar extends StatelessWidget {

  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
    child: ListView(
      primary: false,
      padding: EdgeInsets.all(8),
      children: <Widget>[
        DrawerHeader(
          child: Column(
            children: <Widget>[

              const NavBarTile(
                title: "Details",
                icon: Icons.info,
                widget: DetailsForm.new,
              ),

              const NavBarTile(
                title: "Autonomous",
                icon: Icons.timer_rounded,
                widget: DetailsForm.DetailsForm,
              ),

              const NavBarTile(
                title: "Teleopareted",
                icon: Icons.sports_esports,
                widget: DetailsForm.DetailsForm,
              ),
              
              const NavBarTile(
                title: "End Game",
                icon: Icons.directions_boat,
                widget: DetailsForm.DetailsForm,
              ),

              const NavBarTile(
                title: "General",
                icon: Icons.search_sharp,
                widget: DetailsForm.DetailsForm,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

class NavBarTile extends StatelessWidget {
  const NavBarTile({
    super.key, 
    required this.title,
    required this.icon,
    required this.widget,
  });
  final String title;
  final IconData icon;
  final Widget Function() widget;

  @override
  Widget build(BuildContext context) => ListTile(
    leading: Icon(icon),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        letterSpacing: 1,
      ),
    ),
    onTap: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<Widget>(
          builder: (final BuildContext context) => widget(),
        )
      );
    },
  );
}