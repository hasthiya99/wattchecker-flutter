import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wattchecker/widgets/appbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithoutSearch(
        title: 'About',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Logo
            Center(
              child: Image.asset(
                'assets/images/logo.png', // Replace with your app logo path
                height: 100,
              ),
            ),
            SizedBox(height: 16.0),

            // App Description
            Center(
              child: Text(
                'Wattchecker',
                style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Wattchecker is a comprehensive solution for managing your tasks efficiently. Our app provides features such as task management, reminders, and collaborative tools to help you stay organized.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),

            // Version Info
            Text(
              'Version: 1.0.0',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),

            // Developer Info
            Text(
              'Developed by: Your Company',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () => _launchURL('mailto:developer@example.com'),
              child: Text(
                'Contact us',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 8.0),

            // Links
            GestureDetector(
              onTap: () => _launchURL('https://www.example.com'),
              child: Text(
                'Visit our website',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () => _launchURL('https://www.example.com/terms'),
              child: Text(
                'Terms of Service',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () => _launchURL('https://www.example.com/privacy'),
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to launch URLs
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
