import 'package:fitness_app/widgets.dart';
import 'package:flutter/material.dart';

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trainings of any \nDifficulty level',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: TabBar(
                  controller: tabController,
                  labelStyle:
                      TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.5),
                  ),
                  labelColor: Colors.yellow[800],
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Beginner',
                    ),
                    Tab(
                      text: 'Intermediate',
                    ),
                    Tab(
                      text: 'Advanced',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                child: TabBarView(controller: tabController, children: [
                  GridViewDemo(),
                  Container(
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/lock.png'),
                            fit: BoxFit.fitHeight)),
                    child: Text(
                      'Please! Complete \nthe Beginner Level',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.yellow[800]),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/lock.png'),
                            fit: BoxFit.fitHeight)),
                    child: Text(
                      'Please! Complete \nthe Intermediate Level',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.yellow[800]),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
