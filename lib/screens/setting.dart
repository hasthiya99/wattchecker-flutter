import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wattchecker/screens/profile_screen.dart';
import 'package:wattchecker/widgets/appbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isNotificationEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadNotificationStatus();
  }

  // Load the saved notification status from SharedPreferences
  Future<void> _loadNotificationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isNotificationEnabled = prefs.getBool('isNotificationEnabled') ?? false;
    });
  }

  // Save the notification status to SharedPreferences
  Future<void> _saveNotificationStatus(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isNotificationEnabled', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithoutSearch(
        title: 'Settings',
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Edit Profile Section
          ListTile(
            title: Text('Edit Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          Divider(),

          // Notification Section with Toggle
          ListTile(
            title: Text('Notification'),
            trailing: Switch(
              value: _isNotificationEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isNotificationEnabled = value;
                  _saveNotificationStatus(value);
                });
              },
              activeColor: Colors.green,
            ),
            onTap: () {
              // Optional: You might want to handle tap separately
            },
          ),
          Divider(),

          // Change Mode Section with Toggle

          // Edit Utility Rate Section
          ListTile(
            title: Text('Edit Utility Rate'),
            onTap: () {
              Navigator.pushNamed(context, '/editUtilityRate');
            },
          ),
        ],
      ),
    );
  }
}
