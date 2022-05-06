import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/item/item_model.dart';
import '../../data/repository/item/item_repository.dart';

final itemListModel = ChangeNotifierProvider(
  (ref) => ManagementViewModel()..init(),
);

class ManagementViewModel extends ChangeNotifier {
  final ItemRepository _repository = ItemRepository();
  List<Item> itemList = [];

  Future<void> init() async {
    itemList = await _repository.itemList();
    notifyListeners();
  }
}
