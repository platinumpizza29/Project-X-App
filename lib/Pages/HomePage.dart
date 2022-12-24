// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectxapp/Pages/ChatPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map? userMessages = {
    "Keyur": ["Hello", "this is a test", "lol"],
    "Amog": ["Keyur", "Amogh"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              CupertinoSliverNavigationBar(
                largeTitle: Text("Chats"),
                previousPageTitle: "Logout",
                automaticallyImplyTitle: true,
                automaticallyImplyLeading: true,
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CupertinoSearchTextField(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount:
                              userMessages == null ? 15 : userMessages!.length,
                          itemBuilder: (context, index) {
                            var keys = userMessages!.keys.elementAt(index);
                            List<String> messages =
                                userMessages!.values.elementAt(index);
                            return ListTile(
                              title: Text("$keys"),
                              onTap: () {
                                print(messages);
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => ChatPage(
                                              messages: messages,
                                              keys: keys,
                                            )));
                              },
                            );
                          }))
                ],
              ),
            ),
          )),
    );
  }
}
