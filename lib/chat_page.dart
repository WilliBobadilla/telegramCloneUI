import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  String urlString;
  String description = "";
  ChatPage({Key key, this.title, this.urlString, this.description})
      : super(key: key);

  final String title;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  double _separation = 12;
  TextEditingController _controllerText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CircleAvatar(
            backgroundImage: AssetImage(widget.urlString),
          ),
          Column(
            children: [Text(widget.title), Text(widget.description)],
          ),
          Container(),
          Container()
        ]),
        actions: [
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.more_vert,
            size: 35,
          ),
          Container(width: 10)
        ],
      ),
      body: Stack(
        children: [
          appBody(),
          Positioned(bottom: 0, child: bottomBarTextInput())
        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: bottomBarTextInput(),
      // ),
    );
  }

  Widget yourMessage({String message}) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      // CircleAvatar(
      //   child: widget.icon,
      // ),
      Container(
        //width: 220,
        decoration: BoxDecoration(
            color: Colors.orange[100], borderRadius: BorderRadius.circular(10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            width: 10,
          ),
          Text(
            message,
            style: TextStyle(fontSize: 25),
          ),
          Container(width: 35),
          Column(
            children: [
              Container(height: 10),
              Row(
                children: [
                  Container(height: 25),
                  Text(
                    "16:15",
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(height: 25),
                  Icon(Icons.check),
                  Container(height: 15),
                ],
              ),
            ],
          )
        ]),
      )
    ]);
  }

  Widget contactMessage({String message}) {
    return Row(children: [
      // CircleAvatar(
      //   child: widget.icon,
      // ),
      Container(
        //width: 220,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: 10,
          ),
          Text(
            message,
            style: TextStyle(fontSize: 25),
          ),
          Container(width: 35),
          Column(
            children: [
              Container(
                height: 10,
              ),
              Row(
                children: [
                  Container(height: 25),
                  Text(
                    "16:15",
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(height: 25),
                  Icon(Icons.check),
                  Container(height: 15),
                ],
              ),
            ],
          ),
        ]),
      )
    ]);
  }

  Widget bottomBarTextInput() {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white38),
        child: Row(
          children: [
            Container(
              width: 10,
            ),
            Icon(Icons.emoji_emotions_outlined),
            Container(
              width: 10,
            ),
            Container(
                height: 50,
                width: 250,
                child: TextField(
                  decoration: InputDecoration(hintText: "Message"),
                  controller: _controllerText,
                  keyboardType: TextInputType.text,
                )),
            Spacer(),
            Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
            Spacer(),
            Icon(
              Icons.file_present,
              size: 30,
            ),
            Spacer(),
            Icon(
              Icons.mic_none_outlined,
              size: 30,
            ),
            Spacer(),
          ],
        ));
  }

  Widget appBody() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          Container(
            height: _separation,
          ),
          yourMessage(message: "hello"),
          Container(
            height: _separation,
          ),
          contactMessage(message: "how are you?"),
          Spacer(),
          //bottomBarTextInput()
        ],
      ) /* add child content here */,
    );
  }
}
