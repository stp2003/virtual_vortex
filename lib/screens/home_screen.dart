import 'package:flutter/material.dart';
import 'package:virtual_vortex/screens/history_meeting_screen.dart';
import 'package:virtual_vortex/screens/meeting_screen.dart';

import '../resources/auth_methods.dart';
import '../utils/colors.dart';
import '../widgets/custom_button.dart';
import 'contacts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  //** on page changed function ->
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  //?? list of pages to go to different pages from home screen by clicking on bottom nav bar->
  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const ContactScreen(),
    CustomButton(text: 'Log Out', onPressed: () => AuthMethods().signOut()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //?? app bar ->
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Meet n Chat'),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),

      //?? body ->
      body: pages[_page],

      //?? bottom nav bar ->
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, left: 4.0, right: 4.0),
        child: BottomNavigationBar(
          backgroundColor: footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onPageChanged,
          currentIndex: _page,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.comment_bank,
              ),
              label: 'Meet n Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.lock_clock,
              ),
              label: 'Meeting',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
