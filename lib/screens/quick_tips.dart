import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/tip_card.dart';

class QuickTipsForYou extends StatefulWidget {
  const QuickTipsForYou({super.key});

  @override
  State<QuickTipsForYou> createState() => _QuickTipsForYouState();
}

class _QuickTipsForYouState extends State<QuickTipsForYou> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const FeaturePageAppBar(title: 'Quick Tips for You'),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    // Dummy text
                    const Text(
                      'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF898989),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 15),
                    // Tips List
                    const TipCard(
                      icon: Icons.thermostat,
                      iconColor: appGreen,
                      backgroundColor: greenCardColor,
                      title: 'Tip 01',
                      description:
                          'Adjust fridge temperature by 2°F to save up to 15% on energy usage.',
                    ),
                    const TipCard(
                      icon: Icons.lightbulb,
                      iconColor: appCream,
                      backgroundColor: creamCardColor,
                      title: 'Tip 02',
                      description:
                          'Power down those electronics: Standby power drain adds up. Turn them off!',
                    ),
                    const TipCard(
                      icon: Icons.power_off,
                      iconColor: appGreen,
                      backgroundColor: greenCardColor,
                      title: 'Tip 03',
                      description:
                          'Power down those electronics: Standby power drain adds up. Turn them off!',
                    ),
                    const TipCard(
                      icon: Icons.lightbulb,
                      iconColor: appCream,
                      backgroundColor: creamCardColor,
                      title: 'Tip 04',
                      description:
                          'Power down those electronics: Standby power drain adds up. Turn them off!',
                    ),
                    const TipCard(
                      icon: Icons.thermostat,
                      iconColor: appGreen,
                      backgroundColor: greenCardColor,
                      title: 'Tip 05',
                      description:
                          'Power down those electronics: Standby power drain adds up. Turn them off!',
                    ),
                    const TipCard(
                      icon: Icons.lightbulb,
                      iconColor: appCream,
                      backgroundColor: creamCardColor,
                      title: 'Tip 06',
                      description:
                          'Power down those electronics: Standby power drain adds up. Turn them off!',
                    ),
                    const TipCard(
                      icon: Icons.thermostat,
                      iconColor: appGreen,
                      backgroundColor: greenCardColor,
                      title: 'Tip 07',
                      description:
                          'Power down those electronics: Standby power drain adds up. Turn them off!',
                    ),
                    const SizedBox(height: 70),
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
