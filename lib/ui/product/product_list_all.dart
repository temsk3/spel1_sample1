import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../theme/app_theme.dart';
import 'product_view_model.dart';
import 'widget/product_list.dart';

class ProductAllPage extends HookConsumerWidget {
  const ProductAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final appRoute = useRouter();
    final state = ref.watch(productViewModelProvider);
    final viewModel = ref.watch(productViewModelProvider.notifier);
    return state.when(
      data: (data) {
        return SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              viewModel.readProduct();
            },
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.8,
              ),
              padding: const EdgeInsets.all(16.0),
              itemCount: data.productList.length,
              itemBuilder: (_, index) {
                final product = data.productList[index];
                return ProductCard(index: index, product: product);
              },
            ),
          ),
        );
      },
      error: (e, msg) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Text(
                e.toString(),
                style: theme.textTheme.h30,
              ),
            ),
          ),
        );
      },
      loading: () {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: CircularProgressIndicator(
                color: theme.appColors.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
