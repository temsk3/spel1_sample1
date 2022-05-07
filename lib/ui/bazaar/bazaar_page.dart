import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/bazaar/widget/bazaar_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/header.dart';
import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../routes/app_route.gr.dart';
import '../theme/app_theme.dart';
import 'bazaar_view_model.dart';

class BazaarListPage extends HookConsumerWidget {
  const BazaarListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final state = ref.watch(bazzarViewModelProvider);
    final viewModel = ref.watch(bazzarViewModelProvider.notifier);
    final l10n = useL10n();
    final appRoute = useRouter();
    const approval = true; // c
    return state.when(
      data: (data) {
        return Scaffold(
          backgroundColor: theme.appColors.background,
          appBar: Header(title: 'All Event'),
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                viewModel.readBazaar();
              },
              child: Center(
                child: ListView.builder(
                  itemCount: data.bazaarList.length,
                  itemBuilder: (_, index) {
                    final bazaar = data.bazaarList[index];
                    return EventCard(index: index, bazaar: bazaar);
                  },
                ),
              ),
            ),
          ),
          floatingActionButton: Visibility(
            visible: approval,
            child: FloatingActionButton(
              backgroundColor: theme.appColors.primary,
              foregroundColor: theme.appColors.onPrimary,
              onPressed: () async {
                appRoute.push(const BazaarAddRouter());
              },
              child: const Icon(Icons.add_sharp),
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

// // AlertDialog
// Future<bool> customShowDialog(
//     BuildContext context, String title, String message) async {
//   var result = await showDialog(
//     barrierDismissible: false,
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text(title),
//         content: Text(message),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, false);
//             },
//             child: const Text('キャンセル'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, true);
//             },
//             child: const Text('OK'),
//           ),
//         ],
//       );
//     },
//   );
//   return result;
// }
