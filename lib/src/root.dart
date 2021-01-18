import 'package:flutter/material.dart';
import 'package:web_chat_client/src/auth/login.dart';
import 'package:web_chat_client/src/chat.dart';

enum LoginState {
  loggedOut,
  loggedIn
}

class Root extends StatefulWidget {
  Root({Key key}) : super(key: key);

  @override
  State createState() => RootState();
}

class RootState extends State<Root> {
  LoginState loginState = LoginState.loggedOut;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: loginState == LoginState.loggedOut
          ? LoginScreen(title: 'Sign in', onLogin: () =>
            setState(() {
              this.loginState = LoginState.loggedIn;
            })
          )
          : ChatScreen(title: "Chat"),
    );
  }
}