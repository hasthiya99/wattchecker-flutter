import 'package:flutter/material.dart';
import 'package:wattchecker/services/shared_prefs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Profile Screen'),
          ElevatedButton(
            onPressed: (){
              SharedPrefs().clearData();
              Navigator.pushReplacementNamed(context, '/welcome');
            }, 
            child: Text('Logout',)),
        ],
      )
      );
  }
}