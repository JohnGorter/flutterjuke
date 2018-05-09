import 'package:flutter/material.dart';
import 'package:demo2/models.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';
import 'package:audioplayer/audioplayer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class AlbumDetails extends StatelessWidget {
  AlbumDetails({this.album});
  final Album album;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            padding: new EdgeInsets.only(top: 40.0),
            color: Colors.black,
            child: Column(children: [
              Stack(
                children: <Widget>[
                  Image.network(
                      album.albumArt,
                      width: double.infinity,
                      fit: BoxFit.contain),
                  BackButton(color: Colors.white),
                ],
              ),
              Container(
                height: 20.0,
              ),
              Text("Tracklist",
                  style: Theme
                      .of(context)
                      .textTheme
                      .copyWith(
                          headline:
                              TextStyle(color: Colors.white, fontSize: 24.0))
                      .headline),
              Expanded(
                  child: ListView.builder(
                itemCount: album.tracklist.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(album.tracklist[index],
                          style: TextStyle(color: Colors.white)));
                },
              ))
            ])));
  }
}

class RecordCard extends StatefulWidget {
  RecordCard({this.album});
  final Album album;
  @override
  createState() => _RecordCardState();
}

enum PlayerState { stopped, playing, paused } // <-- new type

class _RecordCardState extends State<RecordCard>
    with SingleTickerProviderStateMixin {
  int angle = 0;
  Ticker ticker;
  AudioPlayer player = new AudioPlayer(); // <-- new member
  PlayerState state = PlayerState.stopped; // <-- new member

  @override
  initState() {
    super.initState();
    ticker = new Ticker((duration) {
      setState(() {
        angle = (angle + 5) % 360;
      });
    });
  }

  // new methods
  Future play() async {
    final result = await player.play(widget.album.demotrack);
    if (result == 1)
      setState(() {
        state = PlayerState.playing;
      });
  }

  Future stop() async {
    final result = await player.stop();
    if (result == 1)
      setState(() {
        state = PlayerState.stopped;
      });
  }
  // end new methods

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: GestureDetector(
            onLongPress: () {
              // <-- changed!!
              if (state == PlayerState.stopped) {
                play();
                ticker.start();
                Scaffold.of(context).showSnackBar(SnackBar(content:Text("Now playing ${widget.album.artist}: ${widget.album.title}")));
              } else {
                stop();
                ticker.stop();
              }
            },
            onTap: () {
              Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return AlbumDetails(album: widget.album);
              }));
            },
            child: Container(
                height: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/record.png"))),
                child: Center(
                    child: Padding(
                        padding: EdgeInsets.all(45.0),
                        child: ClipOval(
                          child: Transform(
                              transform:
                                  new Matrix4.rotationZ(angle * (3.14 / 180)),
                              alignment: Alignment.center,
                              child: Image.network(widget.album.albumArt)),
                        ))))));
  }
}
class HomePage extends StatefulWidget {
  @override
  createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Album> list = new List();                                              //<-- new list for firebase
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseDatabase database = FirebaseDatabase(app: app);                 //<-- new databaseref for firebase
    database.reference().child("Records").onChildAdded.listen((snapshot){   //<-- listen for additions
      setState((){
          list.add(Album(
            artist: snapshot.snapshot.value["artist"],
            albumArt: snapshot.snapshot.value["albumArt"],
            demotrack : snapshot.snapshot.value["demotrack"],
            title: snapshot.snapshot.value["title"],
            tracklist: new List()
          ));                                                         //<-- loading albums
        });
      });
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JukeBox")),
      body: GridView.count(
      crossAxisCount: 2,
      children: new List<Widget>.generate(list.length, (int index) {
        return RecordCard(album: list[index]);                            // <-- change to use database
      }),                         
      ));
  }
  }

FirebaseApp app = new FirebaseApp(name: "john");

main() async {
  await FirebaseApp.configure(name:"john", options: new FirebaseOptions(            // <-- configure database app for firebase
    googleAppID: '1:68039088359:android:bc2d77ede9c0dc3e',
    apiKey: 'AIzaSyA4Uxaamq_fJdvfs2vmWCAEL00hWBMS-4Q',
    databaseURL: 'https://todoapp-7013c.firebaseio.com',
  ));
  
  runApp(new MaterialApp(title: '', home: HomePage()));
  }
