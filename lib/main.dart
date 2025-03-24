import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:heross/ui/auth/register/register_screen.dart';
import 'package:heross/ui/auth/signin/login_screen.dart';
import 'package:heross/ui/characters/khufu.dart';
import 'package:heross/ui/components/chracters_page.dart';
import 'package:heross/ui/components/islampage.dart';
import 'package:heross/ui/components/pharoohpage.dart';
import 'package:heross/ui/home_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);




  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,


      routes: {
        RegisterScreen.routeName:(context)=>RegisterScreen(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        HomeScreen.routeName:(context)=>HomeScreen(),
        CharactersPage.routeName:(context)=>CharactersPage(),
        pharohPage.routeName:(context)=>pharohPage(),
        islamPage.routeName:(context)=>islamPage(),
        KhufuPage.routeName:(context)=>KhufuPage(),







      },


      initialRoute:HomeScreen.routeName,



    );
  }
}
