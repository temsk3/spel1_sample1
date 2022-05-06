import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/theme/app_text_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../data/model/product/product_model.dart';
import '../../../gen/assets.gen.dart';
import '../../hooks/use_l10n.dart';
import '../../hooks/use_router.dart';
import '../../theme/app_theme.dart';

class ProductCard extends HookConsumerWidget {
  int index = 0;
  Product product = Product.empty();
  ProductCard({required int index, required Product product}) {
    this.index = index;
    this.product = product;
  }
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
          color: theme.appColors.background,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name.toString(),
                        style: theme.textTheme.h50
                            .bold()
                            .copyWith(color: theme.appColors.onBackground),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        formatter.format(product.price),
                        style: theme.textTheme.h40
                            .copyWith(color: theme.appColors.onBackground),
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
            // await appRoute.push(ItemDetailsRoute(itemId: index));

            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text('購入処理'),
                );
              },
            );
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
  }
}
