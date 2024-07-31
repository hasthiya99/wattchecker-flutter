import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/styles.dart';
import 'package:wattchecker/screens/updateuser.dart';
import 'package:wattchecker/widgets/creditcard.dart';
import 'package:wattchecker/widgets/gift_card.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('My Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              )),
        ),
        backgroundColor: appGreen,
        centerTitle: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 234, 217, 217)),
                overlayColor: MaterialStateProperty.all(
                    const Color.fromARGB(0, 90, 88, 88)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), // Border radius
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Updateuser()));
              },
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            Creditcard(
              icon: Icons.bolt,
              iconColor: appCream,
              backgroundColor: creamCardColor,
              title: '50',
              description: 'Credits Earned',
            ),
            const Text(
              'Account Setting',
              style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: Colors.grey.shade800),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    'Privacy',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: Colors.grey.shade800),
                  ),
                  Spacer(), // Pushes the icon to the right corner
                  Icon(
                    Icons.chevron_right, // Greater than icon
                    color: Colors.blue.shade900, // Blue color for the icon
                  ),
                ],
              ),
            ),
            const Text(
              'Security Setting',
              style: TextStyle(
                  fontFamily: 'Lexend',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      'Two-factor authentication ',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Colors.grey.shade800),
                    ),
                    Spacer(), // Pushes the icon to the right corner
                    Icon(
                      Icons.chevron_right, // Greater than icon
                      color: Colors.blue.shade900, // Blue color for the icon
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/verifyEmail');
              },
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Colors.grey.shade800),
                    ),
                    Spacer(), // Pushes the icon to the right corner
                    Icon(
                      Icons.chevron_right, // Greater than icon
                      color: Colors.blue.shade900, // Blue color for the icon
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
