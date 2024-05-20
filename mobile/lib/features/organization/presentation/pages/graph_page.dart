import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../widgets/graph_page/graph_detail_widget.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({Key? key}) : super(key: key);

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  late Query dbRef;
  List<double> humidityList = [];
  List<double> temperatureList = [];
  List<double> ppmList = [];
  List<int> mq2ValueList = [];

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref();

    dbRef.onChildAdded.listen((event) {
      _updateLists(event.snapshot.value as Map<dynamic, dynamic>?);
    });

    dbRef.onChildChanged.listen((event) {
      _updateLists(event.snapshot.value as Map<dynamic, dynamic>?);
    });
  }

  void _updateLists(Map<dynamic, dynamic>? data) {
    if (data != null) {
      setState(() {
        humidityList.add((data['humidity'] as num).toDouble());
        temperatureList.add((data['temperature'] as num).toDouble());
        ppmList.add((data['ppm'] as num).toDouble());
        mq2ValueList.add(data['mq2Value'] as int);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: GraphDetailWidget(
          dbRef: dbRef,
          humidityList: humidityList,
          temperatureList: temperatureList,
          ppmList: ppmList,
          mq2ValueList: mq2ValueList,
        ),
      ),
    );
  }
}
