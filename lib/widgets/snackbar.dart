
import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message){
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
      )
    );
}