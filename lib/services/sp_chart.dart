import 'package:shared_preferences/shared_preferences.dart';

class SPChart {
  ///Idea here is to create persistance data to keep recored of our day in-out
  ///activities so we can therefore populate a chart

  //LIST OF KEYS
  static const String createdKey = "CREATEKEY";
  static const String deletedKey = "DELETEKEY";
  static const String accomplishedKey = "ACCOMPLISHKEY";

  ///CREATION
  Future<bool> setCreated(int createdInt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(createdKey, createdInt);
  }

  Future<bool> setDeleted(int deletedInt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(deletedKey, deletedInt);
  }

  Future<bool> setAccomplished(int accomplishedInt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(accomplishedKey, accomplishedInt);
  }

/////RETREIVING DATA
//
  Future<int> getCreated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(createdKey);
  }

  Future<int> getDeleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(deletedKey);
  }

  Future<int> getAccomplished() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(accomplishedKey);
  }

  //DELETE ALL

  Future<bool> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
