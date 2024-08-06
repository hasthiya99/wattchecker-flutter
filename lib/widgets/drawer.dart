import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wattchecker/services/shared_prefs.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs =
        SharedPrefs(); // Assuming you have a method to access shared prefs
    String firstName = prefs.getStringValue('firstName') ?? 'User';
    String lastName = prefs.getStringValue('lastName') ?? 'Name';
    String email = prefs.getStringValue('email') ?? '';
    String? imageUrl =
        prefs.getStringValue('imageUrl'); // Get imageUrl from SharedPrefs

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
                      backgroundImage: imageUrl != null
                          ? FileImage(File(imageUrl))
                          : AssetImage('assets/images/pfp.png')
                              as ImageProvider,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$firstName $lastName',
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Lexend',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          email,
                          style: const TextStyle(
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
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.history, color: Colors.white),
              ),
              title: const Text(
                'History',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.check, color: Colors.white),
              ),
              title: const Text('Saved Products'),
              onTap: () {
                // Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.settings, color: Colors.white),
              ),
              title: const Text('Settings'),
              onTap: () {
                // Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: const CircleAvatar(
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
              title: const Text('Support'),
              onTap: () {
                // Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const CircleAvatar(
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
              title: const Text('About'),
              onTap: () {
                // Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.card_giftcard, color: Colors.white),
              ),
              title: const Text('Gift'),
              onTap: () {
                // Navigator.pushNamed(context, '/settings');
              },
            ),
            ListTile(
              leading: Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.logout, color: Colors.white),
              ),
              title: const Text('Logout'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirm Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                        TextButton(
                          child: const Text('Logout'),
                          onPressed: () async {
                            // Clear all SharedPreferences data except for the image path
                            await SharedPrefs.clearExceptImage();

                            // Navigate to the welcome page
                            Navigator.pushReplacementNamed(context, '/welcome');
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
