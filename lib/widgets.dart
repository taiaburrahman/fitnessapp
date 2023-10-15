import 'dart:convert';
import 'package:fitness_app/second_page.dart';
import 'package:fitness_app/widgets/spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:fitness_app/model/model_class.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  State<GridViewDemo> createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  String link =
      'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR28gInTUqp0IuLVYHcjpbWg2OLc2wJ5qzMo411uCsRw1iQSh0u0gBOuPOE';
  List<Exercises> allData = [];
  late Exercises _exercises;

  void initState() {
    fetchData();
    super.initState();
  }

  bool isSelected = false;
  fetchData() async {
    try {
      isSelected = true;
      var response = await http.get(Uri.parse(link));
      //print('${response.body}');
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var i in data['exercises']) {
          _exercises = Exercises(
            id: i['id'],
            title: i['title'],
            thumbnail: i['thumbnail'],
            gif: i['gif'],
            seconds: i['seconds'],
          );
          setState(() {
            allData.add(_exercises);
          });
          isSelected=false;
        }
      }
    } catch (e) {
      print('erorrrrrrrrsssss====${e}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(inAsyncCall: isSelected==true,
        blur: 0.5,
        opacity: 0.5,
        progressIndicator: spinkit,
        child:  ListView.separated(
            separatorBuilder: (_, index) => SizedBox(
              height: 10,
            ),
            itemCount: allData.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SecondPage(
                      exercises: allData[index],
                    )));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * .45,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                    ),
                    image: DecorationImage(
                        image: NetworkImage('${allData[index].thumbnail}'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * .08,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              end: Alignment.centerLeft,
                              begin: Alignment.center,
                              colors: [
                                Colors.blue.withOpacity(0.3),
                                Colors.black.withOpacity(0.3),
                                Colors.pinkAccent.withOpacity(0.3)
                              ])),
                      child: Text(
                        '${allData[index].title}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.yellow[800]),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
