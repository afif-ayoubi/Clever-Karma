import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/constants/font_manager.dart';
import 'package:mobile/core/extensions/text_theme.dart';
import 'package:mobile/features/auth/presentation/widgets/common_widgets/custom_btn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'line_chart_widget.dart';

class GraphDetailWidget extends StatelessWidget {
  const GraphDetailWidget({
    Key? key,
    required this.dbRef,
    required this.humidityList,
    required this.temperatureList,
    required this.ppmList,
    required this.mq2ValueList,
  }) : super(key: key);

  final Query dbRef;
  final List<double> humidityList;
  final List<double> temperatureList;
  final List<double> ppmList;
  final List<int> mq2ValueList;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> graphConfigs = [
      {
        'title': 'Humidity',
        'list': humidityList,
        'leftTitles': ['0', '20', '40', '60', '80', '100']
      },
      {
        'title': 'Temperature',
        'list': temperatureList,
        'leftTitles': ['0', '10', '20', '30', '40', '50']
      },
      {
        'title': 'PPM',
        'list': ppmList,
        'leftTitles': ['0', '500', '1000', '1500', '2000']
      },
      {
        'title': 'MQ2 Value',
        'list': mq2ValueList,
        'leftTitles': ['0', '100', '200', '300', '400']
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("DashBoard", style:context.displayMedium!.copyWith(fontWeight: FontWeightManager.bold,color: Colors.black)),
              CustomBtn(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.remove('token');
                  context.go('/auth');
                },
                width: true,
                text: 'Sign out',

              ),
            ],
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: dbRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                if (!snapshot.exists || snapshot.value == null) {
                  return Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: graphConfigs.map((config) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Text(config['title'],
                            style: context.bodyMedium!
                                .copyWith(fontWeight: FontWeightManager.bold)),
                        SizedBox(
                          height: 300,
                          child: LineChartWidget(
                            list: config['list'],
                            leftTitles: config['leftTitles'],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
