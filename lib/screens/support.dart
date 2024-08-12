import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wattchecker/widgets/appbar.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithoutSearch(
        title: 'Support',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Need Help?',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),

            // FAQ Section
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text(
                'How to use the app?',
                style: TextStyle(fontFamily: 'Inter'),
              ),
              onTap: () {
                // Navigate to FAQ details
              },
            ),
            ListTile(
              title: Text(
                'How to reset my password?',
                style: TextStyle(fontFamily: 'Inter'),
              ),
              onTap: () {
                // Navigate to FAQ details
              },
            ),
            ListTile(
              title: Text(
                'What should I do if I find a bug?',
                style: TextStyle(fontFamily: 'Inter'),
              ),
              onTap: () {
                // Navigate to FAQ details
              },
            ),
            Divider(),

            // Contact Us Section
            Text(
              'Contact Us',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(
                'Email Support',
                style: TextStyle(fontFamily: 'Inter'),
              ),
              onTap: () => _launchURL('mailto:support@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'Call Support',
                style: TextStyle(fontFamily: 'Inter'),
              ),
              onTap: () => _launchURL('tel:+123456789'),
            ),
            Divider(),

            // Feedback Section
            Text(
              'Send Feedback',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text(
                'Submit Feedback',
                style: TextStyle(fontFamily: 'Inter'),
              ),
              onTap: () => _launchURL('https://www.example.com/feedback'),
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
