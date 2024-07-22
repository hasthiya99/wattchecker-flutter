import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/styles.dart';

class GiftCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String? subtitle; // Make subtitle nullable
  final int credits;
  final VoidCallback onRedeem;

  const GiftCard({
    required this.imagePath,
    required this.title,
    this.subtitle, // Allow subtitle to be optional
    required this.credits,
    required this.onRedeem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14)),
          boxShadow: [
            defaultShadow(),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 190,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      subtitle!,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: textGrey,
                      ),
                    ),
                  ],
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$credits',
                            style: const TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 24,
                              color: Color(0xFF0D9E69),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'Required Credits',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: textGrey,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        child: Text('Redeem'),
                        onPressed: onRedeem,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appGreen,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 13,
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w700,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Gift {
  final int id;
  final String name;
  final int creditCount;
  final bool isPhysicalGift;
  final String? description;
  final String image;

  Gift({
    required this.id,
    required this.name,
    required this.creditCount,
    required this.isPhysicalGift,
    this.description,
    required this.image,
  });

  factory Gift.fromJson(Map<String, dynamic> json) {
    return Gift(
      id: json['id'],
      name: json['name'],
      creditCount: json['creditCount'],
      isPhysicalGift: json['isPhysicalGift'],
      description: json['description'],
      image: json['image'],
    );
  }
}
