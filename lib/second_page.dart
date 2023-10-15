import 'package:fitness_app/model/model_class.dart';
import 'package:fitness_app/third_page.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key, this.exercises}) : super(key: key);

  Exercises? exercises;
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int second = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.black, Colors.pinkAccent])),
        ),
        centerTitle: true,
        title: Text('Fitness App'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  image: DecorationImage(
                      image: NetworkImage('${widget.exercises!.thumbnail}'),
                      fit: BoxFit.cover)),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  SleekCircularSlider(
                    min: 3,
                    max: 10,
                    initialValue: second.toDouble(),
                    onChange: (double value) {
                      setState(() {
                        second = value.toInt();
                      });
                    },
                    innerWidget: (double value) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${second}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.yellow[800]),
                          ),
                        ],
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ThirdPage(
                                exercises: widget.exercises,
                                second: second,
                              )));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.center,
                      height: 50,
                      width: double.infinity,
                      child: Text(
                        'Let\'s start workout',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow[800]),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(colors: [
                            Colors.blue,
                            Colors.black,
                            Colors.pinkAccent
                          ])),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
