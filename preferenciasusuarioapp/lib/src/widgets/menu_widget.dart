import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/pages/home_page.dart';
import 'package:preferenciasusuarioapp/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader( 
              child: Container(),
              decoration: BoxDecoration(
                image: DecorationImage( 
                  image: AssetImage('assets/menu-img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon( Icons.pages, color: Colors.blue),
              title: Text('Pages'),
              onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
            ),
            ListTile(
              leading: Icon( Icons.party_mode, color: Colors.blue),
              title: Text('Party Mode'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon( Icons.people, color: Colors.blue),
              title: Text('People'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon( Icons.settings, color: Colors.blue),
              title: Text('Settings'),
              onTap: () {
                //El pop sirve para eliminar la apertura del menú sin cambiar la raíz
                //Navigator.pop(context);
                //Navigator.pushNamed(context, SettingsPage.routeName);
                Navigator.pushReplacementNamed(context, SettingsPage.routeName);
              } 
            ),
          ],
        ),
      ),
    );
  }
}