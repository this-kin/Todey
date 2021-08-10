import 'package:get/get.dart';
import 'package:todey/services/sp_chart.dart';

class ChartController extends GetxController {
  var createdEvents = 0.obs;
  var deletedEvents = 0.obs;
  var accomplishedEvents = 0.obs;

  //Dependenecy injection
  SPChart spChart = SPChart();

/////Fires on Start
  @override
  void onReady() {
    print(createdEvents.value);
    print(deletedEvents.value);
    print(createdEvents.value);
    super.onReady();
  }

////CREATION
  void create() {
    createdEvents.value = createdEvents.value += 1;
    spChart.setCreated(createdEvents.value);
    updated();
  }

  void deleted() {
    deletedEvents.value = deletedEvents.value += 1;
    spChart.setDeleted(deletedEvents.value);
    update();
  }

  void accomplished() {
    accomplishedEvents.value = accomplishedEvents.value += 1;
    spChart.setAccomplished(accomplishedEvents.value);
    update();
  }

  void updated() {}

  fetchChart() async {
    createdEvents.value = await SPChart.getCreated();
    deletedEvents.value = await SPChart.getDeleted();
    accomplishedEvents.value = await SPChart.getAccomplished();
  }
}
