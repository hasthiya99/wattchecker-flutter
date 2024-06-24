import 'package:flutter/material.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/widgets/buttons.dart';

class SaveProductDetailScreen extends StatefulWidget {
  const SaveProductDetailScreen({super.key});

  @override
  State<SaveProductDetailScreen> createState() =>
      _SaveProductDetailScreenState();
}

class _SaveProductDetailScreenState extends State<SaveProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenSize().width(context) * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/product1.png',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 25),
              Text(
                'Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text Lorem Ipsum is simply dummy text',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF505050),
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Model number',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF505050),
                    ),
                  ),
                  Text('RF25H5617SR',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF313131),
                      )),
                ],
              ),
              SizedBox(height: 12),
              CustomPaint(
                size: Size(double.infinity, 1),
                painter: DashedLinePainter(),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brand name',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF505050),
                    ),
                  ),
                  Text('Samsung Refrigerator',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF313131),
                      )),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1FDF9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(
                                10), // Adjust padding as needed
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF005243)),
                            child: Icon(
                              Icons.energy_savings_leaf,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                '500',
                                style: const TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'kWh/yr',
                                style: const TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Annual Energy Usage',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF505050),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xFFFAEEE4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(
                                10), // Adjust padding as needed
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFE5AB79),
                            ),
                            child: Icon(
                              Icons.attach_money,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                '\$',
                                style: const TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '120',
                                style: const TextStyle(
                                  fontFamily: 'Lexend',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Estimated Annual Cost',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF505050),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Center(
                child: ButtonLong(
                  onPressed: (){
                    Navigator.pushNamed(context, '/saveProduct');
                  }, 
                  text: 'Save Product'
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xFFC0C0C0)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    var max = size.width;
    var dashWidth = 5;
    var dashSpace = 3;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
