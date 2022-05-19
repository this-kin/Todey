import 'package:todey/utils/constant.dart';

class Type {
  final String name;
  final String imageurl;

  Type({this.name, this.imageurl});
}

Type type1 = Type(imageurl: ConstanceData.userIcon, name: "Personal");
Type type2 = Type(imageurl: ConstanceData.gameIcon, name: "Fun");
Type type3 = Type(imageurl: ConstanceData.familyIcon, name: "Family");
Type type4 = Type(imageurl: ConstanceData.suitcaseIcon, name: "Work");
Type type5 = Type(imageurl: ConstanceData.studyingIcon, name: "Academic");

List<Type> allEventTypes = [type1, type2, type3, type4, type5];

//
enum eventType { Personal, Fun, Family, Work, Academic }

//
enum eventCategory { Important, Personal }

//
enum eventWidget { Image, Voice, Text, Blog }
