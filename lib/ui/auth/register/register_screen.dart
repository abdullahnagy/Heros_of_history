import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:heross/core/firebase_erorr_codes.dart';
import 'package:heross/ui/auth/signin/login_screen.dart';
import 'package:heross/ui/components/custom_text_form_field.dart';
import 'package:heross/utiles/dilog_utiles.dart';
import 'package:heross/utiles/email_validation.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "Register";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController NameControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confirmationPasswordControler = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/auth_background.png"),
        ),
      ),

      child: Scaffold(


        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,

        // السماح بتحريك الشاشة عند ظهور الكيبورد
        body: Center(
          child: SingleChildScrollView(

            child: ConstrainedBox( // حل المشكلة بإعطاء حجم مناسب
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: IntrinsicHeight( // يضمن تمدد العناصر بما يناسب محتواها
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 1),


                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Getting Started.!",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            "Create an Account to Continue your all Courses..",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),

                      customTextFormField(
                        labelText: "Full Name",
                        icon: Icons.account_circle_outlined,
                        controller: NameControler,
                        labelColor: Colors.black,
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Please Enter Full Name';
                          }
                          return null;
                        },
                      ),

                      customTextFormField(
                        labelText: "Email",
                        icon: Icons.email_outlined,
                        controller: emailControler,
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Please Enter Your E-Mail';
                          }
                          if (!isValidmail(input)) {
                            return 'E-Mail Bad Format';
                          }
                          return null;
                        },
                      ),

                      customTextFormField(
                        controller: passwordControler,
                        labelText: "Password",
                        isObscureText: true,
                        icon: Icons.key,
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Please Enter Your PassWord';
                          }
                          if (input.length < 8) {
                            return "PassWord Must be at Least 8 char";
                          }
                          return null;
                        },
                      ),

                      customTextFormField(
                        controller: confirmationPasswordControler,
                        labelText: "Confirm Password",
                        isObscureText: true,
                        icon: Icons.key,
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Please Enter Your Confirm PassWord';
                          }
                          if (input != passwordControler.text) {
                            return "Password not Match";
                          }
                          return null;
                        },
                      ),

                      const Spacer(flex: 20),
                      ElevatedButton(
                        onPressed: () {
                          signUp(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffBE8E77),
                          padding: EdgeInsets.symmetric(horizontal: 130, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                        },
                        child: Text(
                          " Already Have an Account? Log In",
                          style: TextStyle(color: Colors.black), // تحديد اللون الأسود
                        ),
                      ),


                      const Spacer(flex: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

      ),
    );
  }

  void signUp(BuildContext context) async {
    // طباعة الـ Form data قبل الـ validation
    print("Email: ${emailControler.text}");
    print("Password: ${passwordControler.text}");
    print("Confirm Password: ${confirmationPasswordControler.text}");

    if (!(formKey.currentState?.validate() ?? false)) {
      print("Form validation failed");
      return;
    }

    try {
      dilogUtiles.showLoadingDialog(context, "Loading..");

      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailControler.text,
        password: passwordControler.text,
      );

      dilogUtiles.hideDilog(context);
      dilogUtiles.showMassage(
        context,
        "User Sign Up Successfuly..",
        posActionTitle: "Ok",
        isDismisable: false,
        posAction: () {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        },
      );

      if (result.user != null) {
        print("Navigating to Login Screen");
      } else {
        print("User creation failed");
      }
    } on FirebaseAuthException catch (e) {
      dilogUtiles.hideDilog(context);

      if (e.code == firebaseErrorCode.weakPassword) {
        dilogUtiles.showMassage(
          context,
          'The password provided is too weak.',
          posActionTitle: "Try Again",
        );
      } else if (e.code == firebaseErrorCode.emailInUse) {
        dilogUtiles.showMassage(
          context,
          'The account already exists for that email.',
          posActionTitle: "Try Again",
        );
      }
    } catch (e) {
      dilogUtiles.hideDilog(context);
      dilogUtiles.showMassage(
        context,
        e.toString(),
        posActionTitle: "Try Again",
      );
      print("Error: ${e.toString()}");
    }
  }
}
