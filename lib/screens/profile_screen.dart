import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tt_meet/constants/colors.dart';
import 'package:tt_meet/constants/image_strings.dart';
import '../resources/auth_methods.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: Text(
          'Profile',
          style: GoogleFonts.inter(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage:
              NetworkImage(_authMethods.user.photoURL.toString()),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(height: 10,),
            Text(
              _authMethods.user.displayName.toString(),
              style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,),
            ),
            SizedBox(height: 5,),
            Text(
              _authMethods.user.email.toString(),
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: purpleColor,),
            ),
            SizedBox(height: 70,),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  backgroundColor: purpleColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                onPressed: () => AuthMethods().signOut(),
                child: Text(
                  'Log Out',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
