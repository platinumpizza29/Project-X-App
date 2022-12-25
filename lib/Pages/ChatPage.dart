// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unnecessary_null_comparison, prefer_if_null_operators

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:lottie/lottie.dart';

import '../generated/message.pbgrpc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.messages,
    required this.keys,
  });
  final List<String> messages;
  final keys;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();
  var sendMessage = "";
  var isLoading = false;
  var result;

  Future<void> ChatService() async {
    final channel = ClientChannel(
      '18.133.75.244',
      port: 8081,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    final stub = ChatMessageServiceClient(channel);

    var input = ChatMessageRequest();
    input.id = widget.keys;
    input.message = messageController.text;
    var lol = Stream.value(input);
    try {
      final response = stub.chat(lol);
      await for (var v in response) {
        setState(() {
          var message1 = v.message;
          widget.messages.add(message1);
        });
      }
      // print('Greeter client received: ${response}');
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }

  handleClick() {
    if (widget.messages == null) {
      return Center(
        child: Lottie.asset('images/chatting.json',
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2),
      );
    } else {
      return Column(
        children: widget.keys
            .map<Widget>((e) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  // child: SizedBox(
                  //   height: 50,
                  //   width: MediaQuery.of(context).size.width / 4,
                  //   child: Card(
                  //     child: ListTile(
                  //       title: Text(e),
                  //       leading: Icon(
                  //         CupertinoIcons.person_alt_circle,
                  //         color: Colors.deepPurpleAccent,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: BubbleSpecialOne(
                      text: messageController.text,
                      color: Color(0xFF1B97F3),
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ))
            .toList(),
      );
    }
  }

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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade400,
              height: MediaQuery.of(context).size.height - 231,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount:
                      widget.messages == null ? 5 : widget.messages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: BubbleSpecialOne(
                        text: widget.messages[index].toString(),
                        color: Color(0xFF1B97F3),
                        tail: true,
                        isSender: false,
                        textStyle: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CupertinoTextField(
                  controller: messageController,
                  keyboardType: TextInputType.text,
                  placeholder: "Type a message",
                  suffix: ButtonBar(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.attach_file_rounded,
                            color: Colors.deepPurpleAccent,
                          )),
                      IconButton(
                          onPressed: () {
                            ChatService();
                            messageController.clear();
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.deepPurpleAccent,
                          )),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
