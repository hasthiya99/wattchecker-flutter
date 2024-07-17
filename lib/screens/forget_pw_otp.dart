import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';
import 'package:wattchecker/models/response_message.dart';
import 'package:wattchecker/screens/forgot_pw_reset.dart';
import 'package:wattchecker/services/api.dart';
import 'package:wattchecker/widgets/buttons.dart';
import 'package:wattchecker/widgets/snackbar.dart';

class VerifyOtp extends StatefulWidget {
  final String email;
  const VerifyOtp({super.key, required this.email});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  late String email;
  List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    email = widget.email;
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
                const Text('Please enter the six (6) digit code that was sent to your email address.', style: TextStyle(fontFamily: 'Inter', fontSize: 14, color: textGrey),),
                
                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: textGrey)
                        ),
                        child: TextFormField(
                          controller: otpControllers[index],
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: ScreenSize().width(context) * 0.04),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                              else if (value.isEmpty){
                                FocusScope.of(context).previousFocus();
                              }
                            },
                        )
                      ),
                    );
                  })
                ),

                const SizedBox(height: 50),
      
                ButtonLong(
                  onPressed: () async {
                    String code = otpControllers.map((controller) => controller.text).join();
                    if(code.length==6){
                      ResponseMessage response = await Api().validateOtp(email, code);
                      if(context.mounted){  
                        if(response.success){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword(email: email)));
                        } else{
                          showSnackBar(context, response.message);
                        }
                      }
                    }
                    
                  }, 
                  text: 'Continue'
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Didn\'t recieve the verification code?', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, color: textGrey),),
                    TextButton(
                      onPressed: (){
                        
                      }, 
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(Colors.transparent
                        )
                      ),
                      child: const Text('Resend', style: TextStyle(fontFamily: 'Mulish', fontSize: 12, fontWeight: FontWeight.bold, color: textBlack, decoration: TextDecoration.underline),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}