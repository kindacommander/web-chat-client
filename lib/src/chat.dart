import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_chat_client/src/msg/message.dart';
import 'package:web_chat_client/src/ws_connection.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key, this.title, @required this.wsConnection}) : super(key: key);

  final String title;
  final WSConnection wsConnection;

  @override
  State createState() => new ChatScreenState(wsConnection: this.wsConnection);
}

class ChatScreenState extends State<ChatScreen> {
  ChatScreenState({@required this.wsConnection});

  final WSConnection wsConnection;

  List<Message> msgs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
              child: StreamBuilder(
                stream: wsConnection.wsChannel.stream,
                builder: (context, snapshot) {
                  Message msg = Message.fromJson(jsonDecode(snapshot.data.toString()));
                  msgs.add(msg);
                  print(msgs[0].body);
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(color: Colors.black),
                    itemCount: msgs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                            msgs[index] != null ? (msgs[index].body + " <- " + msgs[index].sender) : "Connected!"
                        ),
                      );
                    },
                  );
                },
              ),
          ),
        ],
      ),
    );
  }
}
