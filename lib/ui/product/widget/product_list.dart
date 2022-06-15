import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/model/product/product_model.dart';
import '../../../ui/product/widget/picture.dart';
import '../../hooks/use_l10n.dart';
import '../../hooks/use_router.dart';
import '../../routes/app_route.gr.dart';
import '../../theme/app_text_theme.dart';
import '../../theme/app_theme.dart';

class ProductCard extends HookConsumerWidget {
  const ProductCard(
      {Key? key, required this.index, required this.product, this.bazaar})
      : super(key: key);
  final int index;
  final Product product;
  final bazaar;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final appRoute = useRouter();
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return Stack(
      children: [
        Card(
          color: product.stock == 0 ? Colors.black.withOpacity(0.3) : null,
          // : theme.appColors.background,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: const EdgeInsets.all(10.0),
          elevation: 10.0,
          child: Column(
            //
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                  aspectRatio: 16 / 11,
                  child: PictureCover(picture: product.picture1URL)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          product.name.toString(),
                          style: theme.textTheme.h50.bold(),
                          // .copyWith(color: theme.appColors.onBackground),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // const SizedBox(height: 8.0),
                      Expanded(
                        flex: 1,
                        child: Text(formatter.format(product.price),
                            style: theme.textTheme.h40
                            // .copyWith(color: theme.appColors.onBackground),
                            ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        RawMaterialButton(
          onPressed:
              // product.stock == 0
              //     ? null
              //     :
              () async {
            await appRoute.push(
                ProductDetailsRoute(productItem: product, bazaarEvent: bazaar));

            // showDialog(
            //   context: context,
            //   builder: (context) {
            //     return const AlertDialog(
            //       title: Text('購入処理'),
            //     );
            //   },
            // );
          },
          // shape: const CircleBorder(),
          elevation: 0,
          child: const SizedBox(
            width: 240,
            height: 240,
          ),
        ),
        if (product.stock == 0)
          Positioned(
            top: 4,
            child: Text('SOLDOUT', style: theme.textTheme.h60.bold()
                // .copyWith(color: theme.appColors.onPrimary),
                ),
          ),
      ],
    );
  }
}
