// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:projectxapp/Pages/ChatPage.dart';
import 'package:projectxapp/enums/UIEnums.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map? userMessages = {
    "Keyur": ["Hello", "this is a test", "lol"],
    "Amog": ["Keyur", "Amogh"],
    "Samarth": ["PRO", "PERSON"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white24,
        title: Row(
          children: [
            Text(
              UIEnums.CHATS.name,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              CupertinoIcons.chat_bubble_2,
              color: Colors.black,
            ),
            SizedBox(
              width: 230,
            ),
            InkWell(
              onTap: () => {print("profile tapped")},
              child: CircleAvatar(
                radius: 20,
                child: CircleAvatar(
                  radius: 19,
                  foregroundImage: NetworkImage(
                      "http://learnyzen.com/wp-content/uploads/2017/08/test1-481x385.png"),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CupertinoSearchTextField(
                    padding: EdgeInsets.all(10.0),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => {},
                        icon: Lottie.network(
                            "https://assets4.lottiefiles.com/packages/lf20_9ioeesdx.json"),
                        iconSize: 30,
                      ),
                    ],
                  ),
                  Container(
                      color: Colors.grey.shade100,
                      height: MediaQuery.of(context).size.height - 350,
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
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GNav(
          curve: Curves.easeIn,
          haptic: true,
          gap: 6,
          iconSize: 27,
          backgroundColor: CupertinoColors.systemGrey6,
          tabs: [
            GButton(icon: CupertinoIcons.chat_bubble_2),
            GButton(
              icon: CupertinoIcons.phone,
              iconActiveColor: Colors.black,
              iconColor: Colors.grey,
            ),
            GButton(
              icon: CupertinoIcons.person_add,
              iconSize: 30,
              iconActiveColor: Colors.black,
              iconColor: Colors.grey,
            ),
            GButton(
              icon: CupertinoIcons.video_camera,
              iconActiveColor: Colors.black,
              iconColor: Colors.grey,
            ),
            GButton(
              icon: CupertinoIcons.gear,
              iconActiveColor: Colors.black,
              iconColor: Colors.grey,
            ),
          ]),
    );
  }
}
