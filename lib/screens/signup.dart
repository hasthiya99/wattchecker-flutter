import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/api_response.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/services/validations.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/snackbar.dart';
import 'package:wattchecker/widgets/textbox.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text('Create new account', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.bold, color: appGreen),),
                  const SizedBox(height: 10),
                  const Text('Lorem Ipsum is simply dummy text.', style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: textGrey),),
                  const SizedBox(height: 20),
                  
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('Name', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textBlack, fontWeight: FontWeight.bold),),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ReusableTextBox(
                                controller: firstNameController, 
                                hintText: 'First name',
                                validator: (p0) => Validations().validateString(p0),
                              )
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              flex: 1,
                              child: ReusableTextBox(
                                controller: lastNameController, 
                                hintText: 'Last name',
                                validator: (p0) => Validations().validateString(p0),
                              )
                            )
                          ],
                        ),
                        ReusableTextBox(
                                controller: emailController, 
                                title: 'Email',
                                hintText: 'Enter your email',
                                validator: (p0) => Validations().validateEmail(p0),
                              ),
                        ReusableTextBox(
                                controller: zipCodeController, 
                                keyboardType: TextInputType.number,
                                title: 'Zip code',
                                hintText: 'Enter your Zip code',
                                validator: (p0) => Validations().validateZipCode(p0),
                              ),
                        ReusableTextBox(
                                controller: utilityRateController, 
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                title: 'Electricity Rate',
                                hintText: 'cents per kilowatt-hour',
                                validator: (p0) => Validations().validateElectricityRate(p0),
                              ),
                        ReusableTextBox(
                                controller: passwordController, 
                                keyboardType: TextInputType.visiblePassword,
                                title: 'Password',
                                hintText: 'Enter a password',
                                validator: (p0) => Validations().validatePassword(p0),
                                obscureText: hidePassword,
                                suffixIconButton: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  }, 
                                  icon: Icon(hidePassword? Icons.visibility_off : Icons.visibility, color: textGrey)),
                              ),
                        ReusableTextBox(
                                controller: confirmPasswordController, 
                                keyboardType: TextInputType.visiblePassword,
                                title: 'Confirm password',
                                hintText: 'Confirm your password',
                                validator: (p0) => Validations().validatePassword(p0),
                                obscureText: hideConfirmPassword,
                                suffixIconButton: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      hideConfirmPassword = !hideConfirmPassword;
                                    });
                                  }, 
                                  icon: Icon(hideConfirmPassword? Icons.visibility_off : Icons.visibility, color: textGrey)),
                              ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 50),
                  
                  ButtonLong(
                    onPressed:!btnEnabled? (){} : () async {
                      
                      if(formKey.currentState!.validate()){
                        
                        if(passwordController.text == confirmPasswordController.text){
                          setState(() {
                            isLoading = true;
                          });
                          ResponseMessage response = await Api().signUp(
                            firstNameController.text, 
                            lastNameController.text, 
                            emailController.text, 
                            zipCodeController.text, 
                            utilityRateController.text, 
                            passwordController.text
                          );
                        
                          if(context.mounted){
                            setState(() {
                              isLoading = false;
                              if (response.success) {
                                btnEnabled = false;
                              }
                            });

                            if (response.success) {
                              Navigator.pushNamed(context, '/signupSuccess');
                            } else {
                              showSnackBar(context, response.message);
                            }
                          }
                        } else {
                          showSnackBar(context, 'Passwords do not match');
                        }
                      }
                    }, 
                    isLoading: isLoading,
                    text:'Confirm'
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}