import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../hooks/use_l10n.dart';
import 'item_view_model.dart';

class ItemDetailsPage extends HookConsumerWidget {
  const ItemDetailsPage({
    Key? key,
    @PathParam('itemId') required this.itemId,
  }) : super(key: key);
  final int itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final vm = ref.watch(itemListModel);
    final items = vm.itemList[itemId];
    return Scaffold(
      // appBar: Header(title: l10n.productdetails),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                items.name!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
