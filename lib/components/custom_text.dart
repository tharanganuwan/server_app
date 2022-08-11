import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:server_app/utils/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.fontSize = 15,
      this.color = kblack,
      this.fontWeight,
      this.textAlign,
      this.textOverflow = TextOverflow.ellipsis})
      : super(key: key);
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow textOverflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      textAlign: textAlign,
      style: GoogleFonts.poppins(
          fontSize: fontSize, color: color, fontWeight: fontWeight),
    );
  }
}
