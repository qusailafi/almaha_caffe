import 'package:flutter/material.dart';

Container evelvatedButton(
    VoidCallback onPressed, String lable, ButtonStyle? btnStyle,EdgeInsetsGeometry? edge) {
  ButtonStyle style = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50),
  );
  EdgeInsetsGeometry  edgeInset=EdgeInsets.all(0);
  if(edge!=null){
    edgeInset=edge;
  }

  if (btnStyle != null) {
    style = btnStyle;
  }
  return
   Container(padding: edgeInset,child:
   ElevatedButton(
     child: Text(lable),
     onPressed: onPressed,

     style: style,
   ),);
}
