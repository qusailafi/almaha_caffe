import 'package:flutter/material.dart';

Container cardWidget(
    RoundedRectangleBorder? cardShape, Widget widget, EdgeInsets? cardPadding,double ? height) {
  if (cardShape == null) {
    cardShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));
  }
  if (cardPadding == null) {
    cardPadding = EdgeInsets.all(10);
  }
  if(height==null){
    height=40;
  }
  return Container(
    height:height,

    child: Card(

      child: widget,
      shape: cardShape,
    ),
    padding: cardPadding,
  );
}