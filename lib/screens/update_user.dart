import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/user.dart';
import 'package:wattchecker/services/validations.dart';
import 'package:wattchecker/widgets/appbar.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/textbox.dart';

class Updateuser extends StatefulWidget {
  final UserModel user;
  const Updateuser({super.key, required this.user});

  @override
  State<Updateuser> createState() => _SignUpState();
}

class _SignUpState extends State<Updateuser> {
  bool isLoading = false;
  bool btnEnabled = true;
  final formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController utilityRateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    zipCodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    firstNameController.text = widget.user.firstName;
    lastNameController.text = widget.user.lastName;
    emailController.text = widget.user.email;
    zipCodeController.text = widget.user.zipCode;
    utilityRateController.text = widget.user.utility.toString();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const StandardAppBar(title: 'Edit Your Account',),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize().width(context) * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const SizedBox(height: 20),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Name',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 12,
                              color: textBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ReusableTextBox(
                                controller: firstNameController,
                                hintText: 'First name',
                                validator: (value) => Validations().validateString(value),
                              )
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: ReusableTextBox(
                                controller: lastNameController, 
                                hintText: 'Last name',
                                validator: (value) => Validations().validateString(value),
                              )
                            )
                          ],
                        ),
                        ReusableTextBox(
                          controller: emailController, 
                          hintText: 'Email', 
                          title: 'Email',
                          validator: (value)=> Validations().validateEmail(value),
                        ),
                        ReusableTextBox(
                          controller: zipCodeController, 
                          keyboardType: TextInputType.number,
                          hintText: 'Zip code',
                          title: 'Zip code',
                          validator: (value)=> Validations().validateZipCode(value),
                        ),
                        ReusableTextBox(
                          controller: utilityRateController, 
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          title: 'Electricity rate',
                          hintText: 'cents per kilowatt-hour',
                          validator: (value) => Validations().validateElectricityRate(value),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  ButtonLong(
                      onPressed: () {
                        if(formKey.currentState!.validate()){

                        }
                        // Perform your action here
                      },
                      backgroundColor: appGreen,
                      textColor: Colors.white,
                      isLoading: isLoading,
                      text: 'Submit'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
