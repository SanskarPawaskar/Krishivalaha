import 'package:flutter/material.dart';

class ButtonWidget{
  ButtonWidget();
  getButtonStyle(BuildContext context){
   final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      primary: Colors.white,
      // textStyle: const TextStyle(color: Colors.black, fontSize: 25, fontStyle: FontStyle.normal),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
     
      ),
    );
    return raisedButtonStyle;
  }
  
}