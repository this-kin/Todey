import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todey/controllers/chart_controller.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  //Dependency injection
  ChartController chartController = Get.put(ChartController());

 @override
 void initState() { 
   super.initState();
   chartController.onReady();
 }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Obx(
        () => Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(chartController.createdEvents.value.toString()),
              Text(chartController.deletedEvents.value.toString()),
              Text(chartController.accomplishedEvents.value.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
