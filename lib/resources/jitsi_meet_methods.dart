
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
// import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:tt_meet/resources/auth_methods.dart';
import 'package:tt_meet/resources/firestore_methods.dart';

class JitsiMeetMethods{
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  final jitsiMeet = JitsiMeet();
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
    bool isPublic = true,
  }) async{
    try {
      String? name;
      if(username.isEmpty){
        name = _authMethods.user.displayName;
      } else{
        name = username;
      }

      var options = JitsiMeetConferenceOptions(
        // serverURL: 'https://meet.jit.si',
          room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
          "startWithVideoMuted": isPublic,
        },
          featureFlags: {
            FeatureFlags.unsafeRoomWarningEnabled: false,
            FeatureFlags.androidScreenSharingEnabled: true,
          },
        userInfo: JitsiMeetUserInfo(
          displayName: name,
          email: _authMethods.user.email,
          avatar: _authMethods.user.photoURL,
        ),
      );
      _firestoreMethods.addToMeetingHistory(roomName);
      jitsiMeet.join(options);

    } catch (error) {
      print("error: $error");
    }
  }
}


// var options = JitsiMeetingOptions(
//   roomNameOrUrl: roomName,
//   isAudioMuted: isAudioMuted,
//   isVideoMuted: isVideoMuted,
//   userEmail: _authMethods.user.email,
//   userDisplayName: name,
//   userAvatarUrl: _authMethods.user.photoURL,
//   isAudioOnly: false,
// );
// _firestoreMethods.addToMeetingHistory(roomName);
// await JitsiMeetWrapper.joinMeeting(
// options: options,
// );