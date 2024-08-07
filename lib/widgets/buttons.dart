import 'package:flutter/material.dart';
import 'package:wattchecker/constants/colors.dart';
import 'package:wattchecker/constants/screensize.dart';

class ButtonLong extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Color? backgroundColor;
  final Widget? leading;
  final double? elevation;
  final Color? borderColor;
  final bool? isLoading;

  const ButtonLong(
    {
      super.key, 
      required this.onPressed, 
      required this.text, 
      this.textSize, 
      this.fontWeight,
      this.textColor, 
      this.backgroundColor, 
      this.leading,
      this.elevation,
      this.borderColor,
      this.isLoading,
    }
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: (isLoading!=null && isLoading == true)? (){} : onPressed, 
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(backgroundColor??appGreen),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),),
              minimumSize: WidgetStateProperty.all(Size(ScreenSize().width(context)*0.8, 50)),
              overlayColor: WidgetStateProperty.all(appBlack.withOpacity(0.05)),
              elevation: WidgetStateProperty.all(elevation ?? 2),
              side: WidgetStateProperty.all(BorderSide(color: borderColor?? Colors.transparent)),

            ),
            child:
              (isLoading!=null && isLoading == true)? 
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 25,
                      height: 25,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(leading != null) Row(
                    children: [
                      leading!,
                      const SizedBox(width: 20),
                    ],
                  ),
                  Text(
                    text, 
                    style: TextStyle(
                      fontFamily: 'Inter', 
                      fontSize: textSize ?? 16, 
                      color: textColor ?? appWhite, 
                      fontWeight: fontWeight ?? FontWeight.bold
                    )
                  ),
                ],
              ),
          );
  }
}