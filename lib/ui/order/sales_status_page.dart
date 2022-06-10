import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';

import '../../data/repository/transaction/purchase/order_repository_impal.dart';
import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../theme/app_theme.dart';
import 'order_view_model.dart';

class SalesStatusPage extends HookConsumerWidget {
  const SalesStatusPage({Key? key, required this.bazaar}) : super(key: key);
  final bazaar;
  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('code', 100),
      _getTitleItemWidget('product', 200),
      _getTitleItemWidget('sum', 100),
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
        DateFormat.yMMMEd(Localizations.localeOf(context).toString()).add_Hm();
    final scrollController = ScrollController();
    var verticalScrollController = ScrollController();
    var horizontalScrollController = ScrollController();
    return asyncValue.when(
      data: (order) {
        final data = order.where((data) => data.bazaarId == bazaar).toList();
        data.sort((a, b) => a.name.toString().compareTo(b.name.toString()));
        int sum = 0;
        for (var e in data) {
          sum = (sum + e.sum!);
        }
        Widget _generateFirstColumnRow(BuildContext context, int index) {
          return Container(
            width: 100,
            height: 52,
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(data[index].code.toString()),
          );
        }

        Widget _generateRightHandSideColumnRow(
            BuildContext context, int index) {
          return Row(
            children: <Widget>[
              Container(
                width: 200,
                height: 52,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(data[index].name.toString()),
              ),
              Container(
                width: 100,
                height: 52,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(data[index].sum.toString()),
              ),
            ],
          );
        }

        Widget _table() {
          return HorizontalDataTable(
            leftHandSideColumnWidth: 100,
            rightHandSideColumnWidth: 600,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: data.length,
            rowSeparatorWidget: Divider(
              color: theme.appColors.onBackground,
              height: 1.0,
              thickness: 0.0,
            ),
            leftHandSideColBackgroundColor: theme.appColors.background,
            rightHandSideColBackgroundColor: theme.appColors.background,
            onScrollControllerReady: (vertical, horizontal) {
              verticalScrollController = vertical;
              horizontalScrollController = horizontal;
            },
          );
        }

        return Scaffold(
          // appBar: AppBar(
          //   backgroundColor: theme.appColors.primary,
          //   foregroundColor: theme.appColors.onPrimary,
          //   leading: const AutoLeadingButton(),
          //   title: Text('sum:${numFormatter.format(sum)}'),
          //   centerTitle: true,
          // ),
          // drawer: const CustomDrawer(),
          body: SafeArea(
            // child: SingleChildScrollView(
            //   controller: scrollController,
            child: Column(children: [
              Text(
                'sum:${numFormatter.format(sum)}',
                style: theme.textTheme.h50
                    .copyWith(color: theme.appColors.onPrimary),
              ),
              Flexible(child: _table())
            ]),
          ),
          // ),
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
