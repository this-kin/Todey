class ChartModel {
  int id;
  String created;
  String deleted;
  String updated;
  String accomplished;
  ChartModel({this.created, this.updated, this.deleted, this.accomplished});

  ChartModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    created = json["created"];
    deleted = json["deleted"];
    updated = json["updated"];
    accomplished = json["accomplished"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> chart = Map<String, dynamic>();
    chart["id"] = this.id;
    chart["created"] = this.created;
    chart["deleted"] = this.deleted;
    chart["updated"] = this.updated;
    chart["accomplished"] = this.accomplished;

    return chart;
  }
}
