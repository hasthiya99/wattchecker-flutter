import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';

class ReusableTextBox extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? title;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final IconButton? suffixIconButton;
  final bool enabled;


  const ReusableTextBox({
    super.key,
    required this.controller,
    required this.hintText,
    this.title,
    this.suffixIconButton,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.enabled = true,
  });

  @override
  State<ReusableTextBox> createState() => _ReusableTextBoxState();
}

class _ReusableTextBoxState extends State<ReusableTextBox> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.title!=null) Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            widget.title!,
            style: const TextStyle(
              fontFamily: 'Mulish',
              fontSize: 12,
              color: textBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextFormField(
          enabled: widget.enabled,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          controller: widget.controller,
          validator: widget.validator,
          cursorColor: textBlack,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontFamily: 'Mulish',
              fontSize: 12,
              color: textGrey,
            ),
            suffixIcon: widget.suffixIconButton,
            enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: appGrey),
              borderRadius: BorderRadius.circular(10),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: appGrey),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: appGreen),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10),
            errorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
            ),
            errorStyle: const TextStyle(
                height: 0), // Hide default error text
          ),
        ),
        const SizedBox(
                          height: 20,
                        ),
      ],
    );
  }
}
