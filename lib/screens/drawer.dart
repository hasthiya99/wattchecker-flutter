import 'package:flutter/material.dart';
import 'package:wattchecker/services/shared_prefs.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                          'assets/images/your_image.png'), // Replace with your image path
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'User Name', // You can dynamically set the user's name here
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lexend',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'UserName@gmail.com', // You can dynamically set the user's name here
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lexend',
                              fontSize: 16,
                              fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.history, color: Colors.white),
              ),
              title: Text(
                'History',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.check, color: Colors.white),
              ),
              title: Text('Saved Products'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.settings, color: Colors.white),
              ),
              title: Text('Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Text(
                      '?',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              title: Text('Support'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Text(
                      '¡',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              title: Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.card_giftcard, color: Colors.white),
              ),
              title: Text('Gift'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.logout, color: Colors.white),
              ),
              title: Text('Logout'),
              onTap: () {
                SharedPrefs().clearData();
                Navigator.pushReplacementNamed(
                    context, '/welcome'); // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
