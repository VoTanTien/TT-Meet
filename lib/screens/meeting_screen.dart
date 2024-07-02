import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tt_meet/resources/jitsi_meet_methods.dart';
import '../common_widgets/home_meeting_button.dart';
import '../constants/colors.dart';
class MeetingScreen extends StatelessWidget {
  MeetingScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async{
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }
  
  joinMeeting(BuildContext context){
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: Text(
          'Meet & Chat',
          style: GoogleFonts.inter(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric( vertical: 10, horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeMeetingButton(
                  onPressed: createNewMeeting,
                  text: 'New Meeting',
                  icon: Icons.videocam,
                ),
                HomeMeetingButton(
                  onPressed: () => joinMeeting(context),
                  text: 'Join Meeting',
                  icon: Icons.add_box_rounded,
                ),
                HomeMeetingButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/schedule');
                  },
                  text: 'Schedule',
                  icon: Icons.calendar_today,
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Create/Join Meetings with just a click!',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

