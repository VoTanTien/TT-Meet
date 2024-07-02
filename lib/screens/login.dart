import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tt_meet/constants/colors.dart';
import 'package:tt_meet/constants/image_strings.dart';
import 'package:tt_meet/resources/auth_methods.dart';

class loginScreen extends StatefulWidget{
  const loginScreen({super.key});
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric( vertical: 100, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Start or join a meeting',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                height: size.height*0.5,
                width: double.infinity,
                child: Image(image: AssetImage(onboard),),
              ),
              SizedBox(height: 30,),
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
                  onPressed: () async{
                    bool res = await _authMethods.signInWithGoogle(context);
                    if(res){
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  child: Text(
                    'Sign In With Google',
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
      ),
    );
  }
}