import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/theme/app_text_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/repository/transaction/purchase/order_repository_impal.dart';
import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../theme/app_theme.dart';
import 'order_view_model.dart';

class PurchasePage extends HookConsumerWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final appRoute = useRouter();
    final state = ref.watch(orderViewModelProvider);
    final viewModel = ref.watch(orderViewModelProvider.notifier);
    final asyncValue = ref.watch(orderListStreamProvider);
    final NumberFormat numFormatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    final DateFormat dateFormatter =
        DateFormat.yMMMEd(Localizations.localeOf(context).toString());
    final scrollController = ScrollController();
    var verticalScrollController = ScrollController();
    var horizontalScrollController = ScrollController();

    return asyncValue.when(
      data: (data) {
        data.sort((a, b) {
          int result1 =
              a.createdAt.toString().compareTo(b.createdAt.toString());
          if (result1 != 0) return result1;
          int result2 = b.quantity.toString().compareTo(a.quantity.toString());
          return result2;
        });
        // final data = order.where((data) => data.name == 'item').toList();
        return SafeArea(
          child: Center(
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (_, index) {
                final ticket = data[index];
                return Card(
                  color: theme.appColors.background,
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(15)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: const EdgeInsets.all(8.0),
                  elevation: 30.0,
                  child: Column(
                    children: [
                      ListTile(
                        dense: true,
                        leading: Container(
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.5),
                            // borderRadius: BorderRadius.circular(10),
                            image: ticket.picture1URL != null
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        ticket.picture1URL as String),
                                  )
                                : null,
                          ),
                          child: ticket.picture1URL == null
                              ? Center(
                                  child: Text(
                                    'NoImage',
                                    style: theme.textTheme.h20.copyWith(
                                        color: theme.appColors.onPrimary),
                                  ),
                                )
                              : null,
                        ),
                        title: Column(
                          children: [
                            Text(
                              ticket.bazaarName.toString(),
                              style: theme.textTheme.h30.bold().copyWith(
                                  color: theme.appColors.onBackground),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  ticket.name.toString(),
                                  style: theme.textTheme.h30.bold().copyWith(
                                      color: theme.appColors.onBackground),
                                ),
                                // const Padding(
                                //   padding: EdgeInsets.symmetric(horizontal: 20.0),
                                // ),
                                Text(
                                  '${ticket.numberOfUse.toString()}/${ticket.quantity.toString()}',
                                  style: theme.textTheme.h30.bold().copyWith(
                                      color: theme.appColors.onBackground),
                                ),
                              ],
                            ),
                          ],
                        ),
                        subtitle: Text(
                          '有効期限：${dateFormatter.format(ticket.expirationFrom as DateTime)}〜${dateFormatter.format(ticket.expirationTo as DateTime)}',
                          style: theme.textTheme.h10
                              .copyWith(color: theme.appColors.onBackground),
                        ),
                        // trailing: const Icon(Icons.navigate_next),
                        onTap: () {
                          //利用処理
                        },
                      ),
                    ],
                  ),
                );
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

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Name', 100),
      _getTitleItemWidget('Status', 100),
      _getTitleItemWidget('product', 200),
      _getTitleItemWidget('quantity', 100),
      _getTitleItemWidget('Purchase date', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
