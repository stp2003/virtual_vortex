import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200.0, left: 5.0, right: 5.0),
        child: Image.network(
          'https://memetemplatehouse.com/wp-content/uploads/2020/07/bas-sajavat-ke-liye-laga-rakha-hai-carryminati-new-meme-template.jpg',
        ),
      ),
    );
  }
}
