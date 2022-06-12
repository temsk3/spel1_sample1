import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/order/widget/order_datatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../data/repository/transaction/purchase/order_repository_impal.dart';
import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../theme/app_theme.dart';
import 'order_view_model.dart';

class OrderPage extends HookConsumerWidget {
  const OrderPage({Key? key, required this.bazaar}) : super(key: key);
  final String? bazaar;
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
        data.sort((a, b) {
          int result1 =
              a.createdAt.toString().compareTo(b.createdAt.toString());
          if (result1 != 0) return result1;
          int result2 = b.quantity.toString().compareTo(a.quantity.toString());
          return result2;
        });
        // Widget _generateFirstColumnRow(BuildContext context, int index) {
        //   return Container(
        //     width: 100,
        //     height: 52,
        //     padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //     alignment: Alignment.centerLeft,
        //     child: Text(data[index].userName.toString()),
        //   );
        // }

        // Widget _generateRightHandSideColumnRow(
        //     BuildContext context, int index) {
        //   return Row(
        //     children: <Widget>[
        //       Container(
        //         width: 100,
        //         height: 52,
        //         padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //         alignment: Alignment.centerLeft,
        //         child: Row(
        //           children: <Widget>[
        //             Icon(
        //                 data[index].isActive == true
        //                     ? Icons.circle_outlined
        //                     : Icons.check_circle,
        //                 color: data[index].isActive == true
        //                     ? Colors.red
        //                     : Colors.green),
        //             Text(data[index].isActive == true ? 'Not Yat' : 'Done')
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: 100,
        //         height: 52,
        //         padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //         alignment: Alignment.centerLeft,
        //         child: Text(data[index].code.toString()),
        //       ),
        //       Container(
        //         width: 200,
        //         height: 52,
        //         padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //         alignment: Alignment.centerLeft,
        //         child: Text(data[index].name.toString()),
        //       ),
        //       Container(
        //         width: 100,
        //         height: 52,
        //         padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //         alignment: Alignment.centerLeft,
        //         child: Text(data[index].quantity.toString()),
        //       ),
        //       Container(
        //         width: 200,
        //         height: 52,
        //         padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //         alignment: Alignment.centerLeft,
        //         child: Text(
        //             dateFormatter.format(data[index].createdAt as DateTime)),
        //       ),
        //     ],
        //   );
        // }

        return Scaffold(
          // appBar: AppBar(
          //   backgroundColor: theme.appColors.primary,
          //   foregroundColor: theme.appColors.onPrimary,
          //   title: Text(
          //     'status',
          //     style: theme.textTheme.h50,
          //   ),
          //   centerTitle: true,
          //   automaticallyImplyLeading: false,
          //   // leading: const AutoLeadingButton(),
          // ),
          // drawer: const CustomDrawer(),
          //   body: SafeArea(
          //     child: Center(
          //       child: RefreshIndicator(
          //         onRefresh: () async {
          //           // ref.refresh(bazzarViewModelProvider);
          //           viewModel.readOrder();
          //         },
          //         child: Scrollbar(
          //           controller: scrollController,
          //           child: SingleChildScrollView(
          //             controller: scrollController,
          //             scrollDirection: Axis.horizontal,
          //             child: DataTable(
          //               columns: const [
          //                 DataColumn(label: Text('name')),
          //                 DataColumn(label: Text('product')),
          //                 DataColumn(label: Text('quantity')),
          //                 DataColumn(label: Text('price')),
          //                 DataColumn(label: Text('total')),
          //                 DataColumn(label: Text('Purchase date')),
          //                 DataColumn(label: Text('status')),
          //                 DataColumn(label: Text('Date of use')),
          //               ],
          //               rows: List.generate(
          //                 data.length,
          //                 ((index) => (DataRow(
          //                       cells: [
          //                         DataCell(Text(data[index].userName.toString())),
          //                         DataCell(Text(data[index].name.toString())),
          //                         DataCell(Text(data[index].quantity.toString())),
          //                         DataCell(Text(
          //                             numFormatter.format(data[index].price))),
          //                         DataCell(Text(numFormatter.format(
          //                             (data[index].quantity! *
          //                                 data[index].price!)))),
          //                         DataCell(Text(dateFormatter.format(
          //                             data[index].createdAt as DateTime))),
          //                         data[index].isActive == true
          //                             ? const DataCell(Text('Not Yet'))
          //                             : const DataCell(Text('Done')),
          //                         data[index].updatedAt != null
          //                             ? DataCell(Text(dateFormatter.format(
          //                                 data[index].updatedAt as DateTime)))
          //                             : const DataCell(Text('')),
          //                       ],
          //                     ))),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          body: SafeArea(
            child: orderDataTable(data: data),
            // HorizontalDataTable(
            //   leftHandSideColumnWidth: 100,
            //   rightHandSideColumnWidth: 800,
            //   isFixedHeader: true,
            //   headerWidgets: _getTitleWidget(),
            //   leftSideItemBuilder: _generateFirstColumnRow,
            //   rightSideItemBuilder: _generateRightHandSideColumnRow,
            //   itemCount: data.length,
            //   rowSeparatorWidget: Divider(
            //     color: theme.appColors.onBackground,
            //     height: 1.0,
            //     thickness: 0.0,
            //   ),
            //   leftHandSideColBackgroundColor: theme.appColors.background,
            //   rightHandSideColBackgroundColor: theme.appColors.background,
            //   onScrollControllerReady: (vertical, horizontal) {
            //     verticalScrollController = vertical;
            //     horizontalScrollController = horizontal;
            //   },
            // ),
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

//   List<Widget> _getTitleWidget() {
//     return [
//       _getTitleItemWidget('Name', 100),
//       _getTitleItemWidget('Status', 100),
//       _getTitleItemWidget('code', 100),
//       _getTitleItemWidget('product', 200),
//       _getTitleItemWidget('quantity', 100),
//       _getTitleItemWidget('Purchase date', 200),
//     ];
//   }

//   Widget _getTitleItemWidget(String label, double width) {
//     return Container(
//       width: width,
//       height: 56,
//       padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
//       alignment: Alignment.centerLeft,
//       child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
//     );
//   }
}
