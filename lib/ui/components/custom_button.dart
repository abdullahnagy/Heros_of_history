import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   String text_button;
   Function onButtonClickedCallBack;

   CustomButton({required this.text_button,required this.onButtonClickedCallBack});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        onPressed: (){
          onButtonClickedCallBack();

        },
        child: Text(text_button));
  }
}
