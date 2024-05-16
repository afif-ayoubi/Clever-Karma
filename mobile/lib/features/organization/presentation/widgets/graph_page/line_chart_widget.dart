import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/theme/hex_color.dart';

class LineChartWidget extends StatefulWidget {
  final List<dynamic> list;
  final List<String> leftTitles;

  const LineChartWidget(
      {super.key, required this.list, required this.leftTitles});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  List<Color> gradientColors = [
    Color(0xFF50E4FF),
    Color(0xFF2196F3),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.3,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 30,
                left: 12,
                top: 24,
                bottom: 12,
              ),
              child: LineChart(
                showAvg ? avgData(widget.list) : mainData(widget.list),
              ),
            ),
          ),
          SizedBox(
            width: 60,
            height: 34,
            child: TextButton(
              onPressed: () {
                setState(() {
                  showAvg = !showAvg;
                });
              },
              child: Text(
                'avg',
                style: TextStyle(
                  fontSize: 12,
                  color: showAvg ? Colors.black.withOpacity(0.5) : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    if (value.toInt() >= 0 && value.toInt() < widget.leftTitles.length) {
      return Text(widget.leftTitles[value.toInt()],
          style: style, textAlign: TextAlign.left);
    } else {
      return Container();
    }
  }

  LineChartData mainData(List<dynamic> list) {
    double getValue(int index) {
      if (index < list.length) {
        return (double.parse(list[index].toString()) /double.parse(widget.leftTitles[1]) );
      }
      return 0.0;
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, getValue(0)),
            FlSpot(2.6, getValue(1)),
            FlSpot(4.9, getValue(2)),
            FlSpot(6.8, getValue(3)),
            FlSpot(8, getValue(4)),
            FlSpot(9.5, getValue(5)),
            FlSpot(11, getValue(6)),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData(List<dynamic> list) {
    double getValue(int index) {
      if (index < list.length) {
        return (double.parse(list[index].toString()) / 10);
      }
      return 0.0;
    }
    final average = (list[0] +
        list[1]+
        list[2] +
        list[3] +
        list[4]) /
        5;

    List<LineChartBarData> lineBarsData = [];

    if (list.length >6) {
      lineBarsData.add(
        LineChartBarData(
          spots: [
            FlSpot(0, average),
            FlSpot(2.6, average),
            FlSpot(4.9, average),
            FlSpot(6.8, average),
            FlSpot(8, average),
            FlSpot(9.5, average),
            FlSpot(11, average),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      );
    } else {
      lineBarsData.add(
        LineChartBarData(
          spots: [
            FlSpot(0, getValue(0)),
            FlSpot(2.6, getValue(1)),
            FlSpot(4.9, getValue(2)),
            FlSpot(6.8, getValue(3)),
            FlSpot(8, getValue(4)),
            FlSpot(9.5, getValue(5)),
            FlSpot(11, getValue(6)),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      );
    }

    return  LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, getValue(0)),
            FlSpot(2.6, getValue(1)),
            FlSpot(4.9, getValue(2)),
            FlSpot(6.8, getValue(3)),
            FlSpot(8, getValue(4)),
            FlSpot(9.5, getValue(5)),
            FlSpot(11, getValue(6)),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
