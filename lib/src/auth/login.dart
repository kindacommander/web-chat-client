import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_chat_client/src/ws_connection.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({@required this.onLogin, Key key, this.title}) : super(key: key);

  final String title;
  final Function(WSConnection) onLogin;

  @override
  LoginScreenState createState() => LoginScreenState(onLogin: onLogin);
}

class LoginScreenState extends State<LoginScreen> {
  final textStyle = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final loginController = TextEditingController();

  LoginScreenState({@required this.onLogin});

  final Function(WSConnection) onLogin;

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
            isLoggedIn = true;
          });
          var wsConn = WSConnection(loginController.text);
          // TODO handle server response
          onLogin(wsConn);
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
