import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/alertdialog.dart';
import '../common/drawer.dart';
import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../routes/app_route.gr.dart';
import '../theme/app_theme.dart';
import 'product_view_model.dart';

class ProductDetailsPage extends HookConsumerWidget {
  const ProductDetailsPage({
    Key? key,
    @PathParam('index') required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final appRoute = useRouter();
    final state = ref.watch(productViewModelProvider);
    final viewModel = ref.watch(productViewModelProvider.notifier);
    return state.when(
      data: (data) {
        final product = data.productList[index];

        return Scaffold(
          backgroundColor: theme.appColors.background,
          appBar: AppBar(
            backgroundColor: theme.appColors.primary,
            foregroundColor: theme.appColors.onPrimary,
            leading: const AutoBackButton(),
            actions: [
              IconButton(
                  onPressed: () async {
                    // appRoute.pop();
                    var result = await customShowDialog(
                      context,
                      'delete',
                      'Do you want to delete it?',
                    );
                    if (result) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: theme.appColors.error,
                          content: const Text('Processing Data'),
                        ),
                      );
                      viewModel.deleteProduct(
                        productId: product.id.toString(),
                      );
                      appRoute.popUntilRoot();
                    } else {}
                  },
                  icon: const Icon(Icons.delete)),
              IconButton(
                  onPressed: () async {
                    appRoute.push(ProductEditRoute(index: index));
                  },
                  icon: const Icon(Icons.edit)),
            ],
            title: Text(
              product.name.toString(),
            ),
            centerTitle: true,
          ),
          drawer: const CustomDrawer(),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 160,
                    color: theme.appColors.primary,
                    alignment: Alignment.center,
                    child: (product.picture1URL == null ||
                            product.picture1URL == '')
                        ? const Center(child: Text('NoImage'))
                        : SizedBox.expand(
                            child:
                                Image.network(product.picture1URL.toString()),
                          ),
                  ),
                  Text(
                    index.toString(),
                  ),
                  Text(
                    product.id.toString(),
                  ),
                  Text(
                    product.name.toString(),
                  ),
                  Text(
                    product.desc.toString(),
                  ),
                  Text(
                    product.stock.toString(),
                  ),
                  Text(
                    product.price.toString(),
                  ),
                  Text(
                    product.expirationFrom.toString(),
                  ),
                  Text(
                    product.expirationTo.toString(),
                  ),
                  Text(
                    product.exchangeNumber.toString(),
                  ),
                  Text(
                    product.picture1Name.toString(),
                  ),
                  Text(
                    product.picture1URL.toString(),
                  ),
                  Text(
                    product.picture2Name.toString(),
                  ),
                  Text(
                    product.picture2URL.toString(),
                  ),
                  Text(
                    product.picture3Name.toString(),
                  ),
                  Text(
                    product.picture3URL.toString(),
                  ),
                  Text(
                    product.isPublished.toString(),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  // ElevatedButton(
                  //   child: const Text('複写'),
                  //   onPressed: () {
                  //     appRoute.push(const BazaarAddRoute());
                  //   },
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 5.0),
                  // ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     primary: theme.appColors.primary,
                  //     onPrimary: theme.appColors.onPrimary,
                  //   ),
                  //   child: const Text('削除'),
                  //   onPressed: () async {
                  //     // appRoute.pop();
                  //     var result = await customShowDialog(
                  //       context,
                  //       'delete',
                  //       'Do you want to delete it?',
                  //     );
                  //     if (result) {
                  //       ScaffoldMessenger.of(context).showSnackBar(
                  //         SnackBar(
                  //           backgroundColor: theme.appColors.error,
                  //           content: const Text('Processing Data'),
                  //         ),
                  //       );
                  //       viewModel.deleteBazaar(
                  //         bazaarId: product.id.toString(),
                  //       );
                  //       appRoute.popUntilRoot();
                  //     } else {
                  //       // appRoute
                  //       //     .popAndPush(BazaarDetailsRouter(index: index));
                  //     }
                  //   },
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 5.0),
                  // ),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     primary: theme.appColors.primary,
                  //     onPrimary: theme.appColors.onPrimary,
                  //   ),
                  //   child: const Text('更新'),
                  //   onPressed: () async {
                  //     appRoute.push(BazaarEditRoute(index: index));
                  //   },
                  // ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        );
      },
      error: (e, msg) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Text(
              e.toString(),
              style: theme.textTheme.h30,
            ),
          ),
        ),
      ),
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
