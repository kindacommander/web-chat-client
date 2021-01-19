import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WSConnection {
  WSConnection(this._username) {
    this._wsChannel = IOWebSocketChannel.connect(_url + _username);
  }

  final String _url = "ws://192.168.31.103:8080/ws?username=";
  final String _username;

  IOWebSocketChannel _wsChannel;

  String get username => _username;
  IOWebSocketChannel get wsChannel => _wsChannel;

  //TODO implement WS methods
}
