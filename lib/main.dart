import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'The Forty Servants'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;

  List positions = ["Present", "Future", "Past" ];

  List servantPaths = [
    "The-Adventurer-copy.png",
    "The-Balancer-copy.png",
    "The-Carnal-copy.png",
    "The-Chaste-copy.png",
    "The-Conductor-copy.png",
    "The-Contemplator-copy.png",
    "The-Dancer-copy.png",
    "The-Dead-copy.png",
    "The-Depleted-copy.png",
    "The-Desperate-copy.png",
    "The-Devil-copy.png",
    "The-Explorer-copy.png",
    "The-Eye-copy.png",
    "The-Father-copy.png",
    "The-Fixer-copy.png",
    "The-Fortunate-copy.png",
    "The-Gate-Keeper-copy.png",
    "The-Giver-copy.png",
    "The-Guru-copy.png",
    "The-Healer-copy.png",
    "The-Idea-copy.png",
    "The-Levitator-copy.png",
    "The-Librarian-copy.png",
    "The-Lover-copy.png",
    "The-Master-copy.png",
    "The-Media-copy.png",
    "The-Messenger-copy.png",
    "The-Monk-copy.png",
    "The-Moon-copy.png",
    "The-Mother-copy.png",
    "The-Opposer-copy.png",
    "The-Planet-copy.png",
    "The-Protector-copy.png",
    "The-Protester-copy.png",
    "The-Road-Opener-copy.png",
    "The-Saint-copy.png",
    "The-Seer-copy.png",
    "The-Sun-copy.png",
    "The-Thinker-copy.png",
    "The-Witch-copy.png"
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      //var rng = new Random();
      //index = rng.nextInt(40);
      servantPaths.shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
            // Column is also layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  positions[_current].toString().toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              CarouselSlider(
                height: 600.0,
                onPageChanged:(index){
                  setState(() {
                    _current = index;
                  });
                },
                items: servantPaths.sublist(0, 3).map((path) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.black87),
                          child: Image.asset('assets/' + path));
                    },
                  );
                }).toList(),
              ),
            ]),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'ask',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
