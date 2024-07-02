import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('meetings')
      .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> get schedule => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('schedule')
      .snapshots();

  void addToMeetingHistory(String meetingName) async{
    try{
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .add({
        'meetingName': meetingName,
        'createdAt': DateTime.now(),
      });

    }catch(e){
      print(e);
    }
  }

  void addToSchedule(DateTime? day,String meetingName,String timeStart, String timeEnd) async{
    try{
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('schedule')
          .add({
        'day': day,
        'eventName': meetingName,
        'timeStart': timeStart,
        'timeEnd': timeEnd,
      });

    }catch(e){
      print(e);
    }
  }
}