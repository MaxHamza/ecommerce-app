import 'package:flutter/material.dart';
class AppNavigator{
  static void route(BuildContext context,Widget widget){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
  }
}