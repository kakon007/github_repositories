import 'package:flutter/material.dart';

class UIHelper {
  drawAppbarTitle({required String title, Color? txtColor}) {
    txtColor ??= Colors.black;
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(title,
          style: TextStyle(color: txtColor, fontWeight: FontWeight.w700)),
    );
  }
}
