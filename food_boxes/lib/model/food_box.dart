import 'package:uuid/uuid.dart';

class FoodBox {
  FoodBox({
    required this.name,
    required this.price,
    required this.date,
    this.description = "",
    this.imageURL = "",
  }) {
    var uuid = Uuid();
    id = uuid.v4();
  }

  final String name;
  final double price;
  final DateTime date;
  final String description;
  final String? imageURL;
  late final String id;
}

class ExampleBoxes {
  factory ExampleBoxes() {
    return _instance;
  }

  ExampleBoxes._internal();

  static final _instance = ExampleBoxes._internal();
}
