import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/response_message.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/services/validations.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/snackbar.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  const ResetPassword({super.key, required this.email});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  late String email;
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    email = widget.email;
    super.initState();
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
                const Text('Reset your password', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.bold, color: appGreen),),
                const SizedBox(height: 10),
                const Text('Please enter a new password.', style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: textGrey),),
                const SizedBox(height: 20),
                
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('New Password', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textBlack, fontWeight: FontWeight.bold),),
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
                        child: Text('Confirm New Password', style: TextStyle(fontFamily: 'Inter', fontSize: 12, color: textBlack, fontWeight: FontWeight.bold),),
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
                  onPressed: () async {
                    if(formKey.currentState!.validate()){
                      setState(() {
                        isLoading = true;
                      });
                      ResponseMessage response = await Api().resetPassword(email, passwordController.text);
                      setState(() {
                        isLoading = false;
                      });
                      if(response.success){
                        Navigator.pushReplacementNamed(context, '/resetSuccess');
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}