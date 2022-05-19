import 'package:hive/hive.dart';
import 'package:todey/constants/string_constant.dart';
part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserData {
  @HiveField(0)
  String id;
  @HiveField(2)
  String imageUrl;
  @HiveField(3)
  String email;
  @HiveField(4)
  String username;

  UserData({
    this.id,
    this.email,
    this.username,
    this.imageUrl,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    imageUrl = json['imageUrl'];
  }
}

setUserStateToHive(UserData data) async {
  var box = await Hive.openBox<UserData>(userDataString);
  box.put(userDataKey, data);
}
