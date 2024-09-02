import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/api_response.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/services/validations.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/snackbar.dart';
import 'package:wattchecker/widgets/textbox.dart';

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
                  const SizedBox(height: 20,),
                  const Text('Login', style: TextStyle(fontFamily: 'Lexend', fontSize: 25, color: appGreen),),
                  const SizedBox(height: 20),
                  ButtonLong(
                    onPressed: (){
                      //Navigator.pushNamedAndRemoveUntil(context, '/landing', (route) => false);
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
                      //Navigator.pushNamedAndRemoveUntil(context, '/landing', (route) => false);
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
                        ReusableTextBox(
                          controller: emailController, 
                          title: 'Your email',
                          hintText: 'Email',
                          validator: (p0) => Validations().validateEmail(p0),
                        ),
                        ReusableTextBox(
                          controller: passwordController, 
                          title: 'Your password',
                          hintText: 'Password',
                          validator: (p0) => Validations().validatePassword(p0),
                          obscureText: hidePassword,
                          suffixIconButton: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  }, 
                                  icon: Icon(hidePassword? Icons.visibility_off : Icons.visibility, color: textGrey),
                                ),

                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/verifyEmail');
                            }, 
                            style: ButtonStyle(
                              overlayColor: WidgetStateProperty.all(Colors.transparent
                              )
                            ),
                            child: const Text('Forgot password?', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textGrey, decoration: TextDecoration.underline),),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        ButtonLong(
                          onPressed:() async {
                            if(_formKey.currentState!.validate()){
                              setState(() {
                                isLoading = true;
                              });
                              ResponseMessage response = await Api().login(emailController.text, passwordController.text);
                              if(context.mounted){
                                setState(() {
                                  isLoading = false;
                                });
                                showSnackBar(context, response.message);
                                if(response.success){
                                  Navigator.pushNamedAndRemoveUntil(context, '/landing', (route) => false);
                                }
                              }
                            }
                          }, 
                          isLoading: isLoading,
                          text:'Continue'
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
                                overlayColor: WidgetStateProperty.all(Colors.transparent
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