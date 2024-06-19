import 'package:flutter/material.dart';

class StandardAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const StandardAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(title, style: const TextStyle(fontFamily: 'Lexend', fontSize: 16, fontWeight: FontWeight.w600),),
      centerTitle: false,

    );
  }
}