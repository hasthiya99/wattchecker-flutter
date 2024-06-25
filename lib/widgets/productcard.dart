import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatefulWidget {
  final String productName;
  final String imageUrl;
  final DateTime scanDate;

  const ProductCard({
    super.key,
    required this.productName,
    required this.imageUrl,
    required this.scanDate,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Format date using intl package
    String formattedDate =
        DateFormat('MMMM dd, yyyy', 'en_US').format(widget.scanDate);

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: screenHeight * 0.25,
              width: screenWidth * 0.4,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: screenWidth * 0.4,
              child: Text(
                widget.productName,
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
                maxLines: 2, // Set the maximum number of lines
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                formattedDate,
                style: const TextStyle(
                    fontSize: 15, color: Colors.grey, fontFamily: 'Mulish'),
                overflow: TextOverflow.ellipsis,
                maxLines: 2, // Set the maximum number of lines
              ),
            ),
          ],
        ),
      ],
    );
  }
}
