
import 'package:flutter/material.dart';

class dilogUtiles{
  static void showLoadingDialog(BuildContext context,String text,{bool isDismisable=true}){
    showDialog(context: context, builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      content: Row(
        children: [
          CircularProgressIndicator(backgroundColor: Colors.white,color: Colors.brown,),
          SizedBox(width: 8,),
          Text(text,style: TextStyle(color: Colors.black),),

        ],
      ),

    ),
      barrierDismissible: isDismisable,

    );
  }


  static void hideDilog(BuildContext context){
    Navigator.pop(context);
  }




static void showMassage(BuildContext context,String message,
    {String? posActionTitle,String? negActionTitle,
      VoidCallback? posAction,VoidCallback? negAction,
    bool isDismisable=true,

    })

{


    List<Widget> actions=[];

    if(posActionTitle !=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);

        posAction?.call();
      },

          child:Text(posActionTitle,style:TextStyle(color: Colors.black) ,


          )));
    }


    if(negActionTitle !=null){
      actions.add(TextButton(onPressed: (){
        Navigator.pop(context);

        negAction?.call();
      },

          child:Text(negActionTitle,style:
            TextStyle(color: Colors.red),)));
    }




    showDialog(context: context, builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      content: Text(message,style:TextStyle(color: Colors.black),),
      actions: actions,

    ),
      barrierDismissible: isDismisable,
    );



}










}