import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String title;
  final DateTime date;
  final String timeStart;
  final String timeEnd;
  final String id;

  Event({
    required this.title,
    required this.date,
    required this.timeStart,
    required this.timeEnd,
    required this.id,
  });

  factory Event.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data()!;
    return Event(
      date: data['day'].toDate(),
      title: data['eventName'],
      timeStart: data['timeStart'],
      timeEnd: data['timeEnd'],
      id: snapshot.id,
    );
  }

  Map<String, Object?> toFirestore() {
    return {
      "day": Timestamp.fromDate(date),
      "eventName": title,
      "timeStart": timeStart,
      "timeEnd": timeEnd,
    };
  }
}