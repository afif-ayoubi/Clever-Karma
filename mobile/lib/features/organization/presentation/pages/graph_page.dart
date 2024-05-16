import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/wdigets/loading_widget.dart';
import 'package:mobile/features/organization/presentation/widgets/graph_page/line_chart_widget.dart';

import '../widgets/graph_page/graph_detail_widget.dart';

class GraphPage extends StatefulWidget {
  const GraphPage({Key? key}) : super(key: key);

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  late Query dbRef;
  List<double> humidityList = [];
  List<int> temperatureList = [];
  List<double> ppmList = [];
  List<int> mq2ValueList = [];

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref();

    dbRef.onChildAdded.listen((event) {
      _updateLists(event.snapshot.value);
      print(event.snapshot.value);
    });

    dbRef.onChildChanged.listen((event) {
      _updateLists(event.snapshot.value);
      print(event.snapshot.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: _buildWidget(
        dbRef: dbRef,
        list: humidityList,
      )),
    );
  }

  void _updateLists(dynamic data) {
    if (data is Map<dynamic, dynamic>) {
      setState(() {
        humidityList.add(data['humidity']);
        temperatureList.add(data['temperature']);
        ppmList.add(data['ppm']);
        mq2ValueList.add(data['mq2Value']);


      });
    }
  }
}

class _buildWidget extends StatelessWidget {
  const _buildWidget({
    required this.dbRef,
    required this.list,
  });

  final List<dynamic> list;

  final Query dbRef;

  @override
  Widget build(
    BuildContext context,
  ) {
    return GraphDetailWidget(dbRef: dbRef, list: list);
  }
}


