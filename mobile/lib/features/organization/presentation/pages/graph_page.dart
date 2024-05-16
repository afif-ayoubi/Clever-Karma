import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/wdigets/loading_widget.dart';

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
    });

    dbRef.onChildChanged.listen((event) {
      _updateLists(event.snapshot.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(child: _buildWidget(dbRef: dbRef)),
    );
  }

  void _updateLists(dynamic data) {
    if (data is Map<dynamic, dynamic>) {
      setState(() {
        humidityList.add(data['humidity']);
        temperatureList.add(data['temperature']);
        ppmList.add(data['ppm']);
        mq2ValueList.add(data['mq2Value']);

        if (humidityList.length > 5) humidityList.removeAt(0);
        if (temperatureList.length > 5) temperatureList.removeAt(0);
        if (ppmList.length > 5) ppmList.removeAt(0);
        if (mq2ValueList.length > 5) mq2ValueList.removeAt(0);
      });
    }
  }
}

class _buildWidget extends StatelessWidget {
  const _buildWidget({
    super.key,
    required this.dbRef,
  });

  final Query dbRef;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "DashBoard",
            style: context.displayMedium,
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: dbRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                if (!snapshot.exists || snapshot.value == null)
                  return LoadingWidget();

                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
