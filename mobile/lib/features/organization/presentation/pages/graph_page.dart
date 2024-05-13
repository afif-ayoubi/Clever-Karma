import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/wdigets/loading_widget.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  Query dbRef = FirebaseDatabase.instance.ref('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FirebaseAnimatedList(
          query: dbRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            if (!snapshot.exists || snapshot.value == null)
              return LoadingWidget();
            print(snapshot.value);
            Map data = snapshot.value as Map;
            double humidity = data['humidity'];
            double temperature = data['temperature'];
            double ppm = data['ppm'];
            int mq2Value = data['mq2Value'];

            return ListTile(
              title: Text('Humidity: $humidity'),
              subtitle: Text(
                  'Temperature: $temperature\nPPM: $ppm\nMQ2 Value: $mq2Value'),
            );
          },
        ),
      ),
    );
  }
}
