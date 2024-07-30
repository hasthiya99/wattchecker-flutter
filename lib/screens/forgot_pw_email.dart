import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/api_response.dart';
import 'package:wattchecker/screens/forget_pw_otp.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/services/validations.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/snackbar.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context)*0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text('Forgot your password?', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.bold, color: appGreen),),
                const SizedBox(height: 10),
                const Text('Please confirm your email address and we will send you a verification code.', style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: textGrey),),
                const SizedBox(height: 20),
                const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('Email', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textBlack, fontWeight: FontWeight.bold),),
                        ),
                Form(
                  key: formKey,
                  child: TextFormField(
                          controller: emailController,
                          validator: (value) => Validations().validateEmail(value),
                          decoration: InputDecoration(
                            hintText: 'example@email.com',
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
                ),
      
                const SizedBox(height: 50),
      
                ButtonLong(
                  onPressed: () async{
                    if(formKey.currentState!.validate()){
                      // Send verification code
                      setState(() {
                        isLoading = true;
                      });
                      ResponseMessage response = await Api().sendOtp(emailController.text);
                      if(context.mounted){  
                        setState(() {
                          isLoading = false;
                        });
                        if(response.success){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOtp(email: emailController.text)));
                        }else{
                          showSnackBar(context, response.message);
                        }
                      }
                    }
                  }, 
                  isLoading: isLoading,
                  text: 'Confirm'
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}