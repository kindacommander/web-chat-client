import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget{
  ChatScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Container(
          child: Text('ChatScreen'),
        ),
      ),
    );
  }
}
