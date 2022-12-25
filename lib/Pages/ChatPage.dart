// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, unnecessary_null_comparison, prefer_if_null_operators

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:lottie/lottie.dart';

import '../generated/message.pbgrpc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {super.key,
      required this.messages,
      required this.keys,
      required this.id});
  final List<String> messages;
  final keys;
  final id;

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

    var input = ConnectionRequest();
    input.channelName = widget.keys.toString();
    input.userID = "2";
    var joinChannel = stub.joinChannel(input);
    print(joinChannel);

    var chat = ChatMessage();
    chat.senderID = "2";
    chat.message = messageController.text;
    chat.channelName = widget.keys.toString();
    var lol = Stream.value(chat);
    var chatMessage = stub.sendMessage(lol);

    var lel = joinChannel.forEach((element) {
      print(element.message);
      setState(() {
        widget.messages.add(element.message);
      });
    });
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
    print(widget.id);
    print(widget.keys);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(widget.keys),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  height: MediaQuery.of(context).size.height - 160,
                  width: double.infinity,
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
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      );
                    },
                  )),
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
