import 'package:flutter/material.dart';

BoxShadow defaultShadow(){
  return BoxShadow(
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.08)
          );
}