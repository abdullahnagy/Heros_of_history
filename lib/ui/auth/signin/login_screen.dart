import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heross/core/firebase_erorr_codes.dart';
import 'package:heross/ui/auth/register/register_screen.dart';
import 'package:heross/ui/components/custom_text_form_field.dart';
import 'package:heross/ui/home_screen.dart';
import 'package:heross/utiles/dilog_utiles.dart';
import 'package:heross/utiles/email_validation.dart';

class LoginScreen extends StatefulWidget {
 static const String routeName ="Sign In";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 TextEditingController passwordControler =TextEditingController();

 TextEditingController emailControler =TextEditingController();

 TextEditingController confirmationPasswordControler =TextEditingController();

 var formKey =GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(


      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
            image: AssetImage("assets/images/auth_background.png"))
      ),



        child: Scaffold(
          backgroundColor: Colors.transparent,

          body: Center(




            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  const Spacer(flex: 1),
                  Image.asset("assets/images/logoAuth.png",
                    height: 150,),




                  Align(
                    alignment: Alignment.centerLeft,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0), // Adds padding to left
                      child: Text(
                        "Let's SignIn.!",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0), // Adds padding to left
                      child: Text(
                        "Login to Your Account to Continue your all Courses..",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),          //الكلام الي تحت اللوجو





                  SizedBox(height: 30,),








                  customTextFormField(labelText: "Email",icon: Icons.email_outlined,
                  controller: emailControler,
                  validator: (input) {
                    if(input==null||input.trim().isEmpty){
                      return 'Please Enter Your E-Mail';
                    }
                    if(!isValidmail(input)){
                      return 'E-Mail Bad Format';

                    }
                    return null;

                  },),



                  customTextFormField(
                    controller: passwordControler,
                    labelText: "Password",isObscureText: true,icon: Icons.key,
                  validator: (input) {
                    if(input==null||input.trim().isEmpty){
                      return 'Please Enter Your PassWord';
                    }
                    if(input.length<8){
                      return "PassWord Must be at Least 8 char";
                    }
                    return null;


                  },),

                  TextButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, RegisterScreen.routeName);


                  }, child:

                  Text("Don't Have an Account.? Create Account ",

                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),

                  )

                  ),









                  const Spacer(flex: 20),



                  ElevatedButton(
                    onPressed: (){
                      signIn();
                      },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffBE8E77), // لون خلفية الزر
                      padding: EdgeInsets.symmetric(horizontal: 130, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),


                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 16, color: Colors.white), // لون نص الزر
                    ),
                  ),







                  const Spacer(flex: 50),







                ],
              ),
            ),),));
  }

 void signIn()async{


    if(!(formKey.currentState!.validate())){
      return;
    }


    try {

      dilogUtiles.showLoadingDialog(context, "Loading",isDismisable: true);


      var result  = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailControler.text,
          password: passwordControler.text);

          dilogUtiles.hideDilog(context);
          dilogUtiles.showMassage(context, "User Log In Successfuly",posActionTitle: "OK",negActionTitle: "Cancel",
          posAction:(){

            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          } ,
          
          
          );




        //Navigator.pushReplacementNamed(context, HomeScreen.routeName);

    }


    on FirebaseAuthException catch (e) {

      dilogUtiles.hideDilog(context);
      print("Firebase Error Code: ${e.code}");




      if (e.code == 'user-not-found' || e.code == 'invalid-credential')
      {

  dilogUtiles.showMassage(context, "Error E-Mail or Password",posActionTitle: "Cancle");


      }


    }

    catch(e){
      dilogUtiles.hideDilog(context);

      print(e.toString());
    }

 }
}
