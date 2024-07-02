import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tt_meet/constants/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeMeetingButton({Key?key,required this.text, required this.icon, required this.onPressed}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: purpleColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(0, 4)
                )
              ]
            ),
            width: 60,
            height: 60,
            child: Icon(icon, color: Colors.white, size: 30,),
          ),
          SizedBox(height: 10,),
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
