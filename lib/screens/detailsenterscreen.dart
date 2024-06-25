import 'package:flutter/material.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/textbox.dart';

class DetailsEnterScreen extends StatefulWidget {
  const DetailsEnterScreen({super.key});

  @override
  State<DetailsEnterScreen> createState() => _DetailsEnterScreenState();
}

class _DetailsEnterScreenState extends State<DetailsEnterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController modelNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(title: 'Enter details'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ReusableTextBox(
                hintText: 'Ex: Samsung Refrigerator',
                title: 'Product name',
                controller: productNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Product name';
                  }
                  return null;
                },
              ),
              ReusableTextBox(
                hintText: 'Enter Model number',
                title: 'Model number',
                controller: modelNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Model number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20), // Add some spacing before the button
              ButtonLong(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
