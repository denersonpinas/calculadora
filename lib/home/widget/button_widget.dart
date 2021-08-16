import 'package:calculadora/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final double heithSize;
  final double fontSize;
  final String label;
  final Color fontColor;
  final VoidCallback onTap;
  ButtonWidget({
    Key? key, 
    required this.label, 
    required this.fontColor,
    required this.onTap,
    required this.fontSize,
    required this.heithSize,
  }) : super(key: key);

  ButtonWidget.orange({ required String label, required VoidCallback onTap})
    : this.fontColor = AppColors.white,      
      this.onTap = onTap,
      this.fontSize = 15,
      this.heithSize = 48,
      this.label = label;
      
  
  ButtonWidget.numbers({ required String label, required VoidCallback onTap})
    : this.fontColor = AppColors.white,
      this.onTap = onTap,
      this.fontSize = 20,
      this.heithSize = 68,
      this.label = label;
  
  ButtonWidget.fucoes({ required String label, required VoidCallback onTap})
    : this.fontColor = AppColors.white,
      this.onTap = onTap,
      this.fontSize = 15,
      this.heithSize = 48,
      this.label = label;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heithSize,
      child: TextButton(
        onPressed: onTap,
        child: Text(label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: fontSize,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}