import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/model/model_class.dart';
import 'package:fitness_app/widgets/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key? key, this.exercises, this.second}) : super(key: key);

  Exercises? exercises;
  int? second;
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late Timer timer;
  int startSound = 0;
  final audioPlayer=AudioPlayer();

  @override
  void initState() {
    audioPlayer.play(AssetSource('assets/music.mp3'));
    // TODO: implement initState
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      var x = widget.second;
      if (timer.tick == x) {
        timer.cancel();
        setState(() {
          //isPlaying = true;
          //playAudio();
          //showToast("WorkOut Succesfull");
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });
        });
      }
      setState(() {
        startSound = timer.tick;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .50,
              width: double.infinity,
              decoration: BoxDecoration(),
              child: CachedNetworkImage(
                width: double.infinity,
                imageUrl: "${widget.exercises!.gif}",
                fit: BoxFit.cover,
                placeholder: (context, url) => spinkit,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text('${startSound}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.yellow[800])),

            IconButton(onPressed: (){
              AudioPlayer().play(AssetSource('assets/music.mp3'));
            }, icon: Icon(Icons.music_note))
          ],
        ),
      ),
    );
  }
}
