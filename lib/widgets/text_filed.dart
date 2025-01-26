import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container textFiledWidgeth(
    TextEditingController controler,
    String lable,
    TextInputType? type,
    InputDecoration? decoration,
    bool? obScure,
    EdgeInsetsGeometry? edge) {
  bool obs = false;
  EdgeInsetsGeometry? edgeInsets = EdgeInsets.all(0);
  if (obScure != null) {
    obs = obScure;
  }
  if (edge != null) {
    edgeInsets = edge;
  }
  InputDecoration dec = InputDecoration(
    hintText: lable,
    border: InputBorder.none,
    enabledBorder: InputBorder.none, // Remove underline when not focused
    focusedBorder: InputBorder.none,
  );

  if (decoration != null) {
    dec = decoration;
  }

  return Container(
    padding: edgeInsets,
    child: TextField(
      controller: controler,
      decoration: dec,
      keyboardType: type,
      obscureText: obs,
    ),
  );
}
