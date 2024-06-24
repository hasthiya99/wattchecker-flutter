import 'package:flutter/material.dart';
import 'package:wattchecker/widgets/appbar.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FeaturePageAppBar(title: 'Quick Tips for You'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            // Dummy text
            const Text(
              'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text',
              style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF898989),
                  ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15),
            // Tips List
            Expanded(
              child: ListView(
                children: [
                  GreenTipCard(
                    icon: Icons.thermostat,
                    title: 'Tip 01',
                    description:
                        'Adjust fridge temperature by 2°F to save up to 15% on energy usage.',
                  ),
                  OrangeTipCard(
                    icon: Icons.lightbulb,
                    title: 'Tip 02',
                    description:
                        'Power down those electronics: Standby power drain adds up. Turn them off!',
                  ),
                  GreenTipCard(
                    icon: Icons.power_off,
                    title: 'Tip 03',
                    description:
                        'Power down those electronics: Standby power drain adds up. Turn them off!',
                  ),
                  OrangeTipCard(
                    icon: Icons.lightbulb,
                    title: 'Tip 04',
                    description:
                        'Power down those electronics: Standby power drain adds up. Turn them off!',
                  ),
                  GreenTipCard(
                    icon: Icons.thermostat,
                    title: 'Tip 05',
                    description:
                        'Power down those electronics: Standby power drain adds up. Turn them off!',
                  ),
                  OrangeTipCard(
                    icon: Icons.lightbulb,
                    title: 'Tip 04',
                    description:
                        'Power down those electronics: Standby power drain adds up. Turn them off!',
                  ),
                  GreenTipCard(
                    icon: Icons.thermostat,
                    title: 'Tip 05',
                    description:
                        'Power down those electronics: Standby power drain adds up. Turn them off!',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class GreenTipCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const GreenTipCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color(0xFFF1FDF9),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10), // Adjust padding as needed
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFF005243), // Change to any background color you want
            ),
            child: Icon(icon, size: 25,color: Colors.white)
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF898989),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3C3C3C),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrangeTipCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const OrangeTipCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color(0xFFFAEEE4),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFFAEEE4).withOpacity(0.8),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10), // Adjust padding as needed
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFE5AB79), // Change to any background color you want
            ),
            child: Icon(icon, size: 25, color: Colors.white,),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                 style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF898989),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3C3C3C),
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}