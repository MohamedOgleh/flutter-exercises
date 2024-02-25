import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/models/Questions.dart';

class ButtonWidget extends StatelessWidget {
  String title;
  Function onTap;

  ButtonWidget({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: 100,
        // Fixed width
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }


}
