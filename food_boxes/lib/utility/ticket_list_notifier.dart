// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/food_box.dart';
import 'box_list_notifier.dart';
import 'shared_functions.dart';

final ticketListProvider =
    NotifierProvider<TicketListNotifier, List<FoodBox>>(TicketListNotifier.new);

class TicketListNotifier extends Notifier<List<FoodBox>> {
  @override
  build() => [];

  int getNumberOfTickets(String id) {
    return state.where((FoodBox element) => element.id == id).length;
  }

  void updateList() {
    final selectedBoxes = ref.read(selectedBoxesProvider);
    state = [
      ...state,
      ...selectedBoxes,
    ];
  }

  void removeElement(String orderNumber) {
    state = [...state..removeAt(int.parse(orderNumber) - 1)];
  }

  Map<String, List<FoodBox>> getBoxesForDate() {
    // return state.where((FoodBox element) => element.date == date).toList();
    return groupBy(state, (FoodBox e) => formatDate(e.date));
  }
}
