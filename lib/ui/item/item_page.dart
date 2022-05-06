import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../gen/assets.gen.dart';
import '../../ui/theme/app_text_theme.dart';
import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../item/item_view_model.dart';
import '../routes/app_route.gr.dart';
// import '../ui/hooks/use_l10n.dart';
import '../theme/app_theme.dart';

class ItemListPage extends HookConsumerWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    // final state = ref.watch(itemViewModelProvider);
    // final viewModel = ref.watch(itemViewModelProvider.notifier);
    final l10n = useL10n();
    final appRoute = useRouter();
    final vm = ref.watch(itemListModel);
    // final formatter = NumberFormat("#,###");
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: theme.appColors.background,
        appBar: AppBar(
          backgroundColor: theme.appColors.primary,
          foregroundColor: theme.appColors.onPrimary,
          title: Text(
            l10n.productlist,
            style: theme.textTheme.h50,
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: theme.appColors.onPrimary,
            indicatorColor: theme.appColors.onPrimary,
            tabs: const <Tab>[
              Tab(text: 'All Item'),
              Tab(text: 'Food'),
              Tab(text: 'Goods'),
            ],
          ),
        ),
        body: SafeArea(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.8,
            ),
            padding: const EdgeInsets.all(16.0),
            itemCount: vm.itemList.length,
            itemBuilder: (_, index) {
              final product = vm.itemList[index];

              return Stack(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.all(10.0),
                    elevation: 20.0,
                    child: Column(
                      //
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 18 / 11,
                          child: Assets.img.cat.image(
                            fit: BoxFit.cover,
                          ), //
                          // Container(
                          //   color: const Color.fromARGB(255, 38, 19, 214),
                          //   height: 150.0,
                          //   // child: Assets.img.cat.image(width: 200),
                        ),
                        // ListTile(
                        //   title: Text(
                        //     items.name!,
                        //     style: theme.textTheme.h20.bold(),
                        //   ),
                        //   subtitle:
                        //       Text('¥' + formatter.format(items.price).toString()),
                        //   onTap: () {
                        //     appRoute.push(ItemDetailsRoute(itemId: index));
                        //   },
                        // ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                16.0, 12.0, 16.0, 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name.toString(),
                                  style: theme.textTheme.h50.bold(),
                                  maxLines: 1,
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  formatter.format(product.price),
                                  style: theme.textTheme.h40,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () async {
                      await appRoute.push(ItemDetailsRoute(itemId: index));
                    },
                    child: const SizedBox(
                      width: 240,
                      height: 240,
                    ),
                    // shape: const CircleBorder(),
                    elevation: 0,
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.appColors.primary,
          foregroundColor: theme.appColors.onPrimary,
          onPressed: () {
            appRoute.push(const ItemAddRoute());
          },
          child: Icon(
            Icons.add_sharp,
            color: theme.appColors.onPrimary,
          ),
        ),
      ),
    );
  }
}
