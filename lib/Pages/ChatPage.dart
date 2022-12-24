// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unnecessary_null_comparison, prefer_if_null_operators

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.messages, required this.keys});
  final List<String> messages;
  final keys;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(widget.keys),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.teal,
            child: ListView.builder(
              itemCount: widget.messages == null ? 5 : widget.messages.length,
              itemBuilder: (context, index) {
                return BubbleSpecialThree(
                  text: widget.messages[index].toString(),
                  color: Color(0xFF1B97F3),
                  tail: true,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CupertinoTextField(
                placeholder: "Type a message",
              ),
            ),
          )
        ],
      ),
    );
  }
}
