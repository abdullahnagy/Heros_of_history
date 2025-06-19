import 'package:flutter/material.dart';
import 'package:heross/ui/chat/chatscreen.dart';

class KhufuPage extends StatelessWidget {
  static const String routeName = "khufu";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/backpharoh.png"),
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Khufu"),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),



        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/khufulogo.png",
                height: 250,
              ),
            ),
            const SizedBox(height: 30),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffEAEACF),
                borderRadius: BorderRadius.circular(12),


              ),
              child: const Text(
                "اهلا انا الملك خوفو صاحب اكبر هرم من اهرمات مصر وانا اعظم ملك في تاريخ مصر ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),



            const SizedBox(height: 20),




            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: _buildButton(context, "Intro", Color(0xffEAEACF), introPage())),
                const SizedBox(width: 10),
                Expanded(child: _buildButton(context, "Summary", Color(0xffEAEACF), summaryPage())),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [





                Expanded(child: _buildButton(context, "Chat", Color(0xffEAEACF), ChatBotPage()),




                ),













                const SizedBox(width: 10),
                Expanded(child: _buildButton(context, "Quiz", Color(0xffEAEACF), quizPage())),
              ],

            ),
          ],
        ),
      ),
    );
  }




  Widget _buildButton(BuildContext context, String text, Color color, Widget page) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          side: BorderSide(color: Color(0xff004358), width: 2),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}












// صفحات انتقال وهمية، يجب إنشاؤها بشكل فعلي
class introPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("الانترو")), body: Center(child: Text("محتوى صفحة الانترو")));
  }
}

class summaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("السامري")), body: Center(child: Text("محتوى صفحة السامري")));
  }
}

class chatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("الشاااااااااات يولد ")), body: Center(child: Text("محتوى صفحة الشاااااااااات يولد")));
  }
}

class quizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("الكويززز")), body: Center(child: Text("محتوى صفحة الكويززز")));
  }
}
