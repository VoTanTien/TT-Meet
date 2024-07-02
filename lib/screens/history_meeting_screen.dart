import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tt_meet/resources/firestore_methods.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';


class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        title: Text(
          'History of meeting',
          style: GoogleFonts.inter(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: StreamBuilder(
          stream: FirestoreMethods().meetingsHistory,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              reverse: false,
              itemCount: (snapshot.data! as dynamic).docs.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(
                        'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: purpleColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Joined on: ${DateFormat.yMMMd().add_jm().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      Divider(height: 30, thickness: 1, color: Colors.white,),
                    ],
                  ),
                ),
            );
          },
        ),
      ),
    );
  }
}


