import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:convert';
import 'package:web_chat_client/src/msg/message.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final loginController = TextEditingController();

  IOWebSocketChannel wsChannel;

  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    final userNameField = TextField(
      controller: loginController,
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Username',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xFF80438c),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          setState(() {
            wsChannel = IOWebSocketChannel.connect('ws://192.168.31.103:8080/ws');
          });
          var msg = Message(sender: "System", body: "New User: " + loginController.text);
          wsChannel.sink.add(json.encode(msg));
          setState(() {
            isLoggedIn = true;
          });
        },
        child: Text("Login",
          textAlign: TextAlign.center,
          style: textStyle.copyWith(
            color:Colors.white, fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                userNameField,
                SizedBox(height: 35.0),
                loginButton,
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
