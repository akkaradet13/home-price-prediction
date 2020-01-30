import 'package:flutter/material.dart';
import 'package:prediction/tabs/inputpage.dart';
import 'package:prediction/tabs/confirmpage.dart';
import 'package:prediction/tabs/historypage.dart';

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[Inputpage(), Confirm(), History()],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.green,
        child: TabBar(
          tabs: <Tab>[
            Tab(
              icon: Icon(Icons.border_color),
            ),
            Tab(
              icon: Icon(Icons.content_paste),
            ),
            Tab(
              icon: Icon(Icons.history),
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}