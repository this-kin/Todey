class Item {
  bool isSelected;
  final String itemTitle;
  final String itemDesc;
  final String createdTime;
  final String itemType;

  Item(
      {this.itemTitle,
      this.itemDesc,
      this.createdTime,
      this.isSelected,
      this.itemType});
}

Item firstItem = Item(
    isSelected: true,
    itemTitle: "Wake up Buddy",
    itemDesc: "",
    createdTime: "7:00 AM",
    itemType: "Important");
Item secondItem = Item(
    isSelected: false,
    itemTitle: "Morning Run",
    itemDesc: "",
    createdTime: "8:00 AM",
    itemType: "Planned");

Item thirdItem = Item(
    isSelected: false,
    itemTitle: "Daily Workout",
    itemDesc: "Squat 1x3",
    createdTime: "9:00 AM",
    itemType: "Planned");

List<Item> allItem = [firstItem, secondItem, thirdItem];
