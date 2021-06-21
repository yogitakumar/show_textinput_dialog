import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int age = 0;
  TextEditingController ageController = new TextEditingController();
  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          ageController.text="";
          return AlertDialog(
            title: Text('Enter your age'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  age = int.parse(value);
                });
              },
              controller: ageController,
              decoration: InputDecoration(hintText: "18"),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('CANCEL'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              // ignore: deprecated_member_use
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    // age = int.parse(value);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Change Age'),
            onTap: () {
              _displayTextInputDialog(context);
            },
          ),
          Text('Your age is : '+age.toString())
        ],
      ),
    );
  }
}
