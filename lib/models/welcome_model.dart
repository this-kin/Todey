class Welcome {
  final String introTxt;
  final String imageUrl;

  Welcome({this.introTxt, this.imageUrl});
}

Welcome welcome1 =
    Welcome(introTxt: "Create New Events", imageUrl: "images/calendar.png");

Welcome welcome2 = Welcome(
    introTxt: "Local Notification", imageUrl: "images/notification.png");

Welcome welcome3 =
    Welcome(introTxt: "Multiple Languages", imageUrl: "images/translation.png");

List<Welcome> allWelcome = [welcome1, welcome2, welcome3];
