import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tugas_8/app/theme/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.btnColor,
    this.style,
    required this.text,
    this.side,
    required this.onPressed
  });

  final Color? btnColor;
  final TextStyle? style;
  final String text;
  final BorderSide? side;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          side: side,
          backgroundColor: btnColor ?? blueColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        ),
        child: Text(text, 
        style: style ?? GoogleFonts.arimo(color: whiteColor, fontSize: 15, fontWeight: FontWeight.bold),)
        ),
    );
  }
}