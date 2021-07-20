class Type {
  final String name;
  final String imageurl;

  Type({this.name, this.imageurl});
}

Type type1 = Type(imageurl: "images/user.png", name: "Personal");
Type type2 = Type(imageurl: "images/games.png", name: "Fun");
Type type3 = Type(imageurl: "images/home.png", name: "Family");
Type type4 = Type(imageurl: "images/suitcase.png", name: "Work");
Type type5 = Type(imageurl: "images/studying.png", name: "Academic");

List<Type> allEventTypes = [type1, type2, type3, type4, type5];
