class ArrayModel {
  String name;
  bool isChecked;

  ArrayModel({required this.name, this.isChecked = false});

  void toggleChecked() {
    isChecked = !isChecked;
  }
}
