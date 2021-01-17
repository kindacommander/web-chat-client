import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  Message({this.sender, this.body});

  final String sender;
  final String body;

  factory Message.fromJson(Map<String, String> json) => _$MessageFromJson(json);

  // TODO why does not it work?
  //Map<String, String> toJson() => _$MessageToJson(this);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'sender': this.sender,
    'body': this.body,
  };
}