import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  Query dbRef = FirebaseDatabase.instance.ref().child('sensorData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map data = snapshot.value as Map;
            if (  data.containsKey('humidity') && data.containsKey('temperature')) {
              return ListTile(
                title: Text(data['humidity'].toString()),
                subtitle: Text(data['temperature'].toString()),
              );
            } else {
              return ListTile(
                title: Text('Invalid Data'),
              );
            }
          },
        ),
      ),
    );
  }
}

