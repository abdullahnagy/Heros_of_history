import 'package:flutter/material.dart';
import 'package:heross/ui/auth/signin/login_screen.dart';
import 'package:heross/ui/components/chracters_page.dart';
import 'package:heross/ui/components/homescreen_widget.dart';
import 'package:heross/ui/components/islampage.dart';
import 'package:heross/ui/components/pharoohpage.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/auth_background.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [

            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 20), // مسافة من الأعلى
                child: Image.asset(
                  "assets/images/logoAuth.png",
                  height: 200,

                ),
              ),
            ),


            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // سكرول أفقي
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                        SizedBox(width: 20),

                        // مسافة في البداية
                        CustomCard(
                          imagePath: "assets/images/ector ancient egyptian pharaoh.png",
                          title: "Pharaonic era",
                          backgroundColor: const Color(0xffEAEAD0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => pharohPage()),
                            );
                          },
                        ),


                        SizedBox(width: 10),


                        //
                        // مسافة بين البطاقات
                        CustomCard(
                          imagePath: "assets/images/moslemLogo.png",
                          title: "Islamic era",
                          backgroundColor: const Color(0xffEAEAD0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => islamPage()),
                            );
                          },
                        ),
                        SizedBox(width: 10),

                        // مسافة بين البطاقات
                        CustomCard(
                          imagePath: "assets/images/romaneelogo.png",
                          title: "Roman era",
                          backgroundColor: const Color(0xffEAEAD0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CharactersPage()),
                            );
                          },
                        ),
                        SizedBox(width: 10), // مسافة في النهاية
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
