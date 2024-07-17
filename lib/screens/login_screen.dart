import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/response_message.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/services/validations.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/snackbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;

  bool isLoading = false;
  bool btnEnabled = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: ScreenSize().height(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: ScreenSize().width(context) * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Login', style: TextStyle(fontFamily: 'Lexend', fontSize: 25, color: appGreen),),
                  const SizedBox(height: 20),
                  ButtonLong(
                    onPressed: (){
                      Navigator.pushNamedAndRemoveUntil(context, '/landing', (route) => false);
                    }, 
                    leading: SvgPicture.asset('assets/icons/apple.svg', width: 20,),
                    text: 'Login With Apple', 
                    textSize: 12,
                    textColor: textBlack,
                    fontWeight: FontWeight.normal,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    borderColor: appGrey,
                  ),
                  const SizedBox(height: 20,),
                  ButtonLong(
                    onPressed: (){
                      Navigator.pushNamedAndRemoveUntil(context, '/landing', (route) => false);
                    }, 
                    leading: SvgPicture.asset('assets/icons/google.svg', width: 20,),
                    text: 'Login With Google', 
                    textSize: 12,
                    textColor: textBlack,
                    fontWeight: FontWeight.normal,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    borderColor: appGrey,
                  ),
                  const SizedBox(height: 50,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider(color: textGrey, thickness: 0.5, )),
                      SizedBox(width: 50,child: Text('Or', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textGrey),)),
                      Expanded(child: Divider(color: textGrey, thickness: 0.5, )),
                    ],
                  ),
                  const SizedBox(height: 40,),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text('Your Email', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textBlack, fontWeight: FontWeight.bold),),
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (value) => Validations().validateEmail(value),
                          decoration: InputDecoration(
                            hintText: 'Email',
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
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text('Your Password', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textBlack, fontWeight: FontWeight.bold),),
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
                            hintText: 'Password',
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/verifyEmail');
                            }, 
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent
                              )
                            ),
                            child: const Text('Forgot password?', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textGrey, decoration: TextDecoration.underline),),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        ButtonLong(
                          onPressed: isLoading || !btnEnabled ? (){} : () async {
                            if(_formKey.currentState!.validate()){
                              setState(() {
                                isLoading = true;
                              });
                              ResponseMessage response = await Api().login(emailController.text, passwordController.text);

                              if(context.mounted){
                                setState(() {
                                  isLoading = false;
                                  if(response.success){
                                    btnEnabled = false;
                                  }
                                });
                                
                                showSnackBar(context, response.message);
                                if(response.success){
                                  Navigator.pushNamedAndRemoveUntil(context, '/landing', (route) => false);
                                }
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
                          text: isLoading? '': 'Continue'
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('New to WattChecker?', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textGrey),),
                            TextButton(
                              onPressed: (){
                                Navigator.pushNamed(context, '/signup');
                              }, 
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(Colors.transparent
                                )
                              ),
                              child: const Text('Create an account', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, fontWeight: FontWeight.bold, color: textBlack, decoration: TextDecoration.underline),),
                            ),
                          ],
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}