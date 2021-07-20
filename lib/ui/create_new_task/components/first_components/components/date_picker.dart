import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:todey/controllers/item_controller.dart';
import 'package:todey/utils/constant.dart';
import 'package:todey/utils/formatted_date.dart';

class PickerDate extends StatefulWidget {
  @override
  _PickerDateState createState() => _PickerDateState();
}

class _PickerDateState extends State<PickerDate> {
  EventController controller = Get.put(EventController());

  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
        controller.eventDate.value = args.value;
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
      // print(_range);
      print(controller.eventDate.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.h,
      // width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SfDateRangePicker(
        enablePastDates: false,
        onSelectionChanged: _onSelectionChanged,
        rangeTextStyle: kListTileStyle,
        selectionTextStyle: kListTileStyle,
      ),
    );
  }
}
