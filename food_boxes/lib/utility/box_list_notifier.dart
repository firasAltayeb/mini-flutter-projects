import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/food_box.dart';

final selectedBoxesProvider =
    NotifierProvider<BoxListNotifier, List<FoodBox>>(BoxListNotifier.new);

class BoxListNotifier extends Notifier<List<FoodBox>> {
  @override
  build() => [];

  int getNumberOfBoxes(String id) {
    return state.where((FoodBox element) => element.id == id).length;
  }

  void updateList(FoodBox passedBox) {
    state = [
      ...state,
      passedBox,
    ];
  }

  void clearList() {
    state = [];
  }

  void removeBox(FoodBox passedBox) {
    state = [...state..remove(passedBox)];
  }
}
