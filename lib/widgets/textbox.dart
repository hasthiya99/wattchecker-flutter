import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';

class ReusableTextBox extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String title;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool enabled;


  const ReusableTextBox({
    super.key,
    required this.controller,
    required this.hintText,
    required this.title,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.enabled = true,
  });

  @override
  State<ReusableTextBox> createState() => _ReusableTextBoxState();
}

class _ReusableTextBoxState extends State<ReusableTextBox> {
  bool _hasError = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w800,
            fontSize: 14,
          ),
        ),
        // Add some spacing between title and text field
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: navButtonFalse, // Black color border
              width: 1.0, // Border width
            ),
          ),
          child: TextFormField(
            enabled: widget.enabled,
            controller: widget.controller,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            validator: (value) {
              final errorMessage = widget.validator?.call(value);
              setState(() {
                _hasError = errorMessage != null;
                _errorMessage = errorMessage ?? '';
              });
              return null;
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontFamily: 'Mulish',
                color: Color(0xFFB4BDC4),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ),
        // Add a SizedBox or Padding for the error message
        if (_hasError)
          Padding(
            padding: const EdgeInsets.only(bottom :10.0),
            child: Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 12.0),
            ),
          ),
      ],
    );
  }
}
