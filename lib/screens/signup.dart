import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/response_message.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/services/validations.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/snackbar.dart';

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
                              child: TextFormField(
                                controller: firstNameController,
                                validator: (value) => Validations().validateName(value),
                                decoration: InputDecoration(
                                  hintText: 'First name',
                                  hintStyle: const TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textGrey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: appGrey),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: appGreen),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorStyle: const TextStyle(height: 0), // Hide default error text
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: lastNameController,
                                validator: (value) => Validations().validateName(value),
                                decoration: InputDecoration(
                                  hintText: 'Last name',
                                  hintStyle: const TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textGrey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: appGrey),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: appGreen),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorStyle: const TextStyle(height: 0), // Hide default error text
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('Email', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textBlack, fontWeight: FontWeight.bold),),
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (value) => Validations().validateEmail(value),
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            hintStyle: const TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textGrey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: appGrey),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: appGreen),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorStyle: const TextStyle(height: 0), // Hide default error text
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('Zip code', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textBlack, fontWeight: FontWeight.bold),),
                        ),
                        TextFormField(
                          controller: zipCodeController,
                          validator: (value) => Validations().validateZipCode(value),
                          decoration: InputDecoration(
                            hintText: 'Enter your zip code',
                            hintStyle: const TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textGrey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: appGrey),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: appGreen),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorStyle: const TextStyle(height: 0), // Hide default error text
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('Electricity Rate', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textBlack, fontWeight: FontWeight.bold),),
                        ),
                        TextFormField(
                          controller: utilityRateController,
                          validator: (value) => Validations().validateElectricityRate(value),
                          decoration: InputDecoration(
                            hintText: 'cents per kilowatt-hour',
                            hintStyle: const TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textGrey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: appGrey),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: appGreen),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorStyle: const TextStyle(height: 0), // Hide default error text
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text('Password', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textBlack, fontWeight: FontWeight.bold),),
                          ),
                        TextFormField(
                                controller: passwordController,
                                validator: (value) => Validations().validatePassword(value),
                                obscureText: hidePassword,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        hidePassword = !hidePassword;
                                      });
                                    }, 
                                    icon: Icon(hidePassword? Icons.visibility_off : Icons.visibility, color: textGrey),
                                  ),
                                  hintText: 'Enter a password',
                                  hintStyle: const TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: appGrey),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: appGreen),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorStyle: const TextStyle(height: 0), // Hide default error text
                                ),
                              ),
                        const SizedBox(height: 20,),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('Confirm Password', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textBlack, fontWeight: FontWeight.bold),),
                        ),
                        TextFormField(
                                controller: confirmPasswordController,
                                validator: (value) => Validations().validatePassword(value),
                                obscureText: hideConfirmPassword,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        hideConfirmPassword = !hideConfirmPassword;
                                      });
                                    }, 
                                    icon: Icon(hideConfirmPassword? Icons.visibility_off : Icons.visibility, color: textGrey),
                                  ),
                                  hintText: 'Confirm your password',
                                  hintStyle: const TextStyle(fontFamily: 'Inter', fontSize: 12, color: textGrey),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: appGrey),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: appGreen),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorStyle: const TextStyle(height: 0), // Hide default error text
                                ),
                              ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 50),
                  
                  ButtonLong(
                    onPressed: isLoading || !btnEnabled? (){} : () async {
                      
                      if(formKey.currentState!.validate()){
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
                        if(!mounted) return;
                        setState(() {
                          isLoading = false;
                          if(response.success){
                            btnEnabled = false;
                          }
                        });
                        if(response.success){
                          Navigator.pushNamed(context, '/signupSuccess');
                        } else {
                          showSnackBar(context, response.message);
                        }
                        
                      }
                      
                    }, 
                    leading: isLoading? const SizedBox(
                            height: 25,
                            width: 25,
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                strokeWidth: 2,
                              ),
                            ),
                          ): null,
                    text: isLoading? '' : 'Confirm'
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