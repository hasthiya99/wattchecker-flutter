import 'package:flutter/material.dart';
import 'package:wattchecker/constants/styles.dart';

class Creditcard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color iconColor;
  final Color backgroundColor;

  const Creditcard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          defaultShadow(),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8), // Adjust outer padding as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor, // Background color of the outer circle
            ),
            child: Container(
              padding:
                  const EdgeInsets.all(8), // Adjust inner padding as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Background color of the inner circle
              ),
              child: Icon(icon, size: 25, color: iconColor),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3C3C3C),
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF898989),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
