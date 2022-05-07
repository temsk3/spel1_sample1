import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../theme/app_theme.dart';
import 'product_view_model.dart';
import 'widget/product_list.dart';

class ProductPage extends HookConsumerWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final appRoute = useRouter();
    final state = ref.watch(productViewModelProvider);
    final viewModel = ref.watch(productViewModelProvider.notifier);
    return state.when(
      data: (data) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: theme.appColors.background,
            appBar: AppBar(
              toolbarHeight: 30,
              backgroundColor: theme.appColors.primary,
              foregroundColor: theme.appColors.onPrimary,
              leading: const AutoBackButton(),
              title: Text(
                // l10n.productlist,
                'Product List',
                style: theme.textTheme.h40,
              ),
              centerTitle: true,
              bottom: TabBar(
                labelColor: theme.appColors.onPrimary,
                unselectedLabelColor: theme.appColors.onSecondary,
                indicatorColor: theme.appColors.onPrimary,
                tabs: const <Tab>[
                  Tab(text: 'All Item'),
                  Tab(text: 'Food'),
                  Tab(text: 'Goods'),
                ],
              ),
            ),
            body: SafeArea(
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
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: theme.appColors.primary,
              foregroundColor: theme.appColors.onPrimary,
              onPressed: () {
                // appRoute.push(const ItemAddRoute());
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      title: Text('商品追加処理'),
                    );
                  },
                );
              },
              child: Icon(
                Icons.add_sharp,
                color: theme.appColors.onPrimary,
              ),
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
