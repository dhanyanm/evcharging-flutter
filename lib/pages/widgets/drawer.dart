import 'package:flutter/material.dart';
import 'package:login_ui/pages/widgets/profile_page.dart';
import 'package:login_ui/pages/widgets/vehicle.dart';

import '../login_page.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationDrawerWidgetState();
  }
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.teal.shade400,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 50),
            buildMenuItem(
                text: 'Profile',
                icon: Icons.people,
                onClicked: () => selectedItem(context, 0)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'My Vehicles',
                icon: Icons.car_rental,
                onClicked: () => selectedItem(context, 1)),
            const SizedBox(height: 16),
            buildMenuItem(
                text: 'Logout',
                icon: Icons.logout,
                onClicked: () => selectedItem(context, 2)),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.black87;
    final hoverColor = Colors.white38;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Profile(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Vehicle(),
        ));
        break;
      case 2:
        Navigator.pushNamed(context, '/');
        break;
    }
  }
}
