import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tt_meet/common_widgets/home_meeting_button.dart';
import 'package:tt_meet/constants/colors.dart';
import 'package:tt_meet/resources/auth_methods.dart';
import 'package:tt_meet/screens/history_meeting_screen.dart';
import 'package:tt_meet/screens/meeting_screen.dart';
import 'package:tt_meet/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page){
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,

        body: pages[_page],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: greyColor,
          onTap: onPageChanged,
          currentIndex: _page,
          unselectedFontSize: 14,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank,),
              label: 'Meet & chat'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock,),
                label: 'Meetings'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline,),
                label: 'Profile'
            ),
          ],
        ),
      ),
    );
  }
}
