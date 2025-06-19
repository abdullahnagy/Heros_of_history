import 'package:flutter/material.dart';
import 'package:heross/ui/characters/khufu.dart';

class pharohPage extends StatelessWidget {
  static const String routeName = "pharohPage";

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
          title: Text(
            "Pharaonic era",
            style: TextStyle(
              fontFamily: 'Serif',
              fontSize: 40,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),





        body: Column(
          children: [

            // الصورة في الجزء العلوي تحت الـ AppBar
            Image.asset(
              "assets/images/logophar.png",
              height: 200,
            ),

            const SizedBox(height: 20),

            // مسافة بين الصورة والكاردات
            // الصف العلوي (3 كاردات)
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _buildCard(context, "khufu", "assets/images/khofff.png",  KhufuPage())),
                  Expanded(child: _buildCard(context, "akhenaten", "assets/images/akhenaton.png", AkhenatenPage())),
                  Expanded(child: _buildCard(context, "Narmer", "assets/images/narmar.png", NarmerPage())),
                ],
              ),
            ),
            // الصف السفلي (3 كاردات)
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _buildCard(context, "Hatshbsout", "assets/images/hatshbs.png", HatshbsoutPage())),
                  Expanded(child: _buildCard(context, "Thutmose III", "assets/images/hams.png", ThutmosePage())),
                  Expanded(child: _buildCard(context, "Ramses II", "assets/images/ramses.png", RamsesPage())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة لبناء الكارد مع إمكانية تحديد الصفحة التي سيتم الانتقال إليها
  Widget _buildCard(BuildContext context, String text, String logoPath, Widget targetPage) {
    return GestureDetector(
      onTap: () {
        // الانتقال للصفحة المخصصة لكل كارد
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => targetPage,
          ),
        );
      },
      child: Card(
        elevation: 5, // ظل للكارد
        color: Color(0xffEAEACF).withOpacity(0.7), // لون خلفية الكارد مع شفافية
        margin: const EdgeInsets.all(8), // مسافة حول الكارد
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // زوايا مدورة
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logoPath, // مسار الـ logo
              height: 95, // ارتفاع الـ logo
            ),
            const SizedBox(height: 10), // مسافة بين الـ logo والنص
            Text(
              text,
              style: const TextStyle(fontSize: 15, color: Colors.black, fontFamily: "Serif"),
            ),
          ],
        ),
      ),
    );
  }
}















// ✅ الصفحات المختلفة لكل كارد بدون تغيير أي شيء آخر


class AkhenatenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Akhenaten")),
      body: Center(child: Text("Welcome to Akhenaten Page!", style: TextStyle(fontSize: 24, color: Colors.white))),
    );
  }
}

class NarmerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text("Narmer")),
      body: Center(child: Text("Welcome to Narmer Page!", style: TextStyle(fontSize: 24, color: Colors.white))),
    );
  }
}

class HatshbsoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(title: Text("Hatshbsout")),
      body: Center(child: Text("Welcome to Hatshbsout Page!", style: TextStyle(fontSize: 24, color: Colors.white))),
    );
  }
}

class ThutmosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(title: Text("Thutmose III")),
      body: Center(child: Text("Welcome to Thutmose III Page!", style: TextStyle(fontSize: 24, color: Colors.white))),
    );
  }
}

class RamsesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(title: Text("Ramses II")),
      body: Center(child: Text("Welcome to Ramses II Page!", style: TextStyle(fontSize: 24, color: Colors.white))),
    );
  }
}
