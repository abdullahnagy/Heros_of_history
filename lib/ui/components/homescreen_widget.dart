import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color backgroundColor;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110, // عرض البطاقة
        height: 140, // ارتفاع البطاقة
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cursive',
              ),
            ),
          ],
        ),
      ),
    );
  }
}