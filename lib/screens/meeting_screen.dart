import 'dart:math';

import 'package:flutter/material.dart';
import 'package:virtual_vortex/resources/jitsi_meet_methods.dart';

import '../widgets/home_page_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  //?? crete new meeting ->
  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  //?? joining meeting ->
  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  //** build ->
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeMeetingButton(
                onPressed: createNewMeeting,
                text: 'New Meet',
                icon: Icons.videocam,
              ),
              HomeMeetingButton(
                onPressed: () => joinMeeting(context),
                text: 'Join Meet',
                icon: Icons.add_box_rounded,
              ),
              //?? more features for further implementation ->
//               HomeMeetingButton(
//                 onPressed: () {},
//                 text: 'Schedule',
//                 icon: Icons.calendar_today,
//               ),
//               HomeMeetingButton(
//                 onPressed: () {},
//                 text: 'Share Screen',
//                 icon: Icons.arrow_upward_rounded,
//               ),
            ],
          ),

          //?? middle screen ->
          const Expanded(
            child: Center(
              child: Text(
                'Create/ Join Meetings with just a click..',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                  letterSpacing: 0.8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
