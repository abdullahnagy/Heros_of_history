import 'package:flutter/material.dart';


class islamPage extends StatelessWidget {
  static const String routeName = "islamPage";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/backislam.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "الحقبة الأسلامية",
            style: TextStyle(
              fontFamily: 'Cursive',
              fontSize: 45,
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
              "assets/images/islamlogo.png",
              height: 200,
            ),
            const SizedBox(height: 20), // مسافة بين الصورة والكاردات
            // الصف العلوي (3 كاردات)
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _buildCard(context, "عمرو بن العاص", "assets/images/amribnaas.png")),
                  Expanded(child: _buildCard(context, "صلاح الدين ", "assets/images/salah.png")),
                  Expanded(child: _buildCard(context, "سيف الدين قطز", "assets/images/qotoz.png")),
                ],
              ),
            ),
            // الصف السفلي (3 كاردات)
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _buildCard(context, "الظاهر بيبرس", "assets/images/bebars.png")),
                  Expanded(child: _buildCard(context, "محمد علي "  ,  "assets/images/mohamedali.png")),
                  Expanded(child: _buildCard(context, "أحمد بن طولون", "assets/images/tulon.png")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // دالة علشان تبني كارد
  Widget _buildCard(BuildContext context, String text, String logoPath) {
    return GestureDetector(
      onTap: () {
        // الانتقال لصفحه تانيه
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnotherPage(text: text), // الصفحه التانيه
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
              style: const TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// الصفحه التانيه
class AnotherPage extends StatelessWidget {
  final String text;

  const AnotherPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Another Page"),
      ),
      body: Center(
        child: Text("You clicked on: $text"),
      ),
    );
  }
}