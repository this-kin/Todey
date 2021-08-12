import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todey/utils/constant.dart';

class ChartWidget extends StatefulWidget {
  final List<PieChartSectionData> section;
  int touchedIndex;

  ChartWidget({Key key, this.section, this.touchedIndex}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: PieChart(
          PieChartData(
              pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                setState(() {
                  final desiredTouch =
                      pieTouchResponse.touchInput is! PointerExitEvent &&
                          pieTouchResponse.touchInput is! PointerUpEvent;
                  if (desiredTouch && pieTouchResponse.touchedSection != null) {
                    widget.touchedIndex = pieTouchResponse.touchedSectionIndex;
                  } else {
                    widget.touchedIndex = -1;
                  }
                });
              }),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              sections: widget.section),
          swapAnimationDuration: kDuration,
        ),
      ),
    );
  }
}
