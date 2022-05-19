class Onboard {
  final String introTxt;
  final String imageUrl;

  Onboard({this.introTxt, this.imageUrl});
}

Onboard firstModel = Onboard(
    introTxt: "Create New Events", imageUrl: "assets/images/calendar.png");

Onboard secondModel = Onboard(
    introTxt: "Local Notification", imageUrl: "assets/images/notification.png");

Onboard thirdModel = Onboard(
    introTxt: "Multiple Languages", imageUrl: "assets/images/language.png");

List<Onboard> allOnboard = [firstModel, secondModel, thirdModel];
