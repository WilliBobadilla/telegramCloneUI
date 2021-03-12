import 'package:flutter/material.dart';
import 'package:telegram_clone/chat_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegram Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Telegram'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double textSize = 18;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          Icon(
            Icons.search,
            size: 35,
          ),
          Container(width: 10)
        ],
      ),
      drawer: Drawer(
          child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                          radius: 40,
                          child: Icon(
                              Icons.person) //Image.asset("assets/photo2.png"),
                          ),
                      Icon(
                        Icons.brightness_3_outlined,
                        size: 35,
                      )
                    ]),
                Row(
                  children: [
                    Text(
                      "Antonio Bobadilla",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "+595975628443",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Icon(
                      Icons.arrow_downward_sharp,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text("New Group", style: TextStyle(fontSize: textSize)),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Contacts", style: TextStyle(fontSize: textSize)),
          ),
          ListTile(
            leading: Icon(Icons.call_sharp),
            title: Text("Calls", style: TextStyle(fontSize: textSize)),
          ),
          ListTile(
            leading: Icon(Icons.location_history),
            title: Text("People Nearby", style: TextStyle(fontSize: textSize)),
          ),
          ListTile(
            leading: Icon(Icons.save),
            title: Text("Saved Messages", style: TextStyle(fontSize: textSize)),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings", style: TextStyle(fontSize: textSize)),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text("Invite People", style: TextStyle(fontSize: textSize)),
          ),
          ListTile(
            leading: Icon(Icons.question_answer),
            title: Text("Telegram FAQ", style: TextStyle(fontSize: textSize)),
          )
        ],
      )),
      body: Center(
        child: ListView(
          children: <Widget>[
            cardOfMessages(
              title: "VK Music Bot",
              subtitle: "What song is your favorite?",
              urlImage: "assets/photo6.png",
            ),
            cardOfMessages(
                title: "Jhon Doe",
                subtitle: "Will you go to the Pary?",
                urlImage: "assets/photo4.png",
                day: "Thue"),
            cardOfMessages(
                title: "Bryan",
                subtitle: "Hello, what are you doing?",
                urlImage: "assets/photo2.png",
                description: "Last seen 14:20",
                day: "14:15"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget cardOfMessages(
      {String title = "",
      String subtitle = "",
      String day = "Mon",
      String urlImage = "assets/photo3.jpeg",
      String description = ""}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatPage(
                      title: title,
                      urlString: urlImage,
                      description: description,
                    )),
          );
        },
        child: Card(
            child: ListTile(
          leading: CircleAvatar(
            foregroundColor: Colors.transparent,
            backgroundImage: AssetImage(urlImage),
            radius: 26,
          ),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              title,
              style: TextStyle(fontSize: 22),
            ),
            Text(day)
          ]),
          subtitle: Text(subtitle),
        )));
  }
}
