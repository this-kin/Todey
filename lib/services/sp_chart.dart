import 'package:shared_preferences/shared_preferences.dart';

class SPChart {
  ///Idea here is to create persistance data to keep recored of our day in-out
  ///activities so we can therefore populate a chart

  //LIST OF KEYS
  static const String createdKey = "CREATEKEY";
  static const String deletedKey = "DELETEKEY";
  static const String accomplishedKey = "ACCOMPLISHKEY";

  ///CREATION
  ///
  ///
  ///
  static setCreated(int createdInt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(createdKey, createdInt);
  }

  static setDeleted(int deletedInt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(deletedKey, deletedInt);
  }

  static setAccomplished(int accomplishedInt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(accomplishedKey, accomplishedInt);
  }

/////RETREIVING DATA
//
  static Future<int> getCreated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(createdKey);
  }

  static Future<int> getDeleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(deletedKey);
  }

  static Future<int> getAccomplished() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(accomplishedKey);
  }

  //DELETE ALL

  static Future<bool> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
