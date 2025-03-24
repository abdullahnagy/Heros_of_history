import 'package:flutter/material.dart';


typedef Validator =String? Function(String?);
class customTextFormField extends StatelessWidget {
  String labelText;
  bool isObscureText;
  IconData? icon;
  double iconSize;
  Color labelColor;
  Validator? validator;
  TextEditingController? controller;


  customTextFormField({required this.labelText,this.isObscureText=false,this.icon,this.iconSize=17,this.labelColor=Colors.black,this.validator,this.controller});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width; // هنا استخدمنا MediaQuery

    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 7),
      child: SizedBox(

        width: screenWidth * 0.83,
        child: TextFormField(
          validator: validator,
          controller: controller ,

          obscureText: isObscureText,
          decoration: InputDecoration(


            labelText:labelText,
            filled: true,
            fillColor: Colors.white,




            border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.white,width: 2)
            ),
            enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.white,width: 2)
              ),

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color:labelColor,width: 1,),

            ),


            errorBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.red,width: 1)
            ),

            prefixIcon: icon != null ? Icon(icon, color: Colors.black, size: iconSize) : null,
            labelStyle: TextStyle(color: labelColor),// التحكم في الحجم هنا






          ),
        ),
      ),
    );
  }
}
