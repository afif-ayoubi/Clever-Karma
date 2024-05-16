import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/core/wdigets/loading_widget.dart';
import 'package:mobile/features/organization/presentation/widgets/graph_page/line_chart_widget.dart';

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
                List<String> leftTitles = _generateLeftTitles(3);

                return Column(
                  children: [
                    Gap(30.h),
                    SizedBox(
                        height: 400.h,
                        child: LineChartWidget(
                            list: list, leftTitles: leftTitles)),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<String> _generateLeftTitles(int index) {
  List<String> leftTitles = [];

  if (index == 0) {
    leftTitles = ['0', '40', '60', '80', '100', '120'];
  } else if (index == 1) {
    leftTitles = ['0', '5', '10', '15', '20', '25'];
  } else if (index == 2) {
    leftTitles = ['0', '400', '1000', '2000', '3000', '4000'];
  } else {
    leftTitles = ['0', '10', '20', '30', '40', '50'];
  }
  return leftTitles;
}
