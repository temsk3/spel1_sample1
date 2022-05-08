import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/alertdialog.dart';
import '../common/drawer.dart';
import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../routes/app_route.gr.dart';
import '../theme/app_theme.dart';
import 'bazaar_view_model.dart';

class BazaarDetailsPage extends HookConsumerWidget {
  const BazaarDetailsPage({
    Key? key,
    @PathParam('index') required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final appRoute = useRouter();
    final state = ref.watch(bazzarViewModelProvider);
    final viewModel = ref.watch(bazzarViewModelProvider.notifier);
    return state.when(
      data: (data) {
        final bazaar = data.bazaarList[index];

        return Scaffold(
          backgroundColor: theme.appColors.background,
          appBar: AppBar(
            backgroundColor: theme.appColors.primary,
            foregroundColor: theme.appColors.onPrimary,
            leading: Row(
              children: [
                const AutoBackButton(),
                Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.account_circle),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      tooltip: MaterialLocalizations.of(context)
                          .openAppDrawerTooltip,
                    );
                  },
                ),
              ],
            ),
            // automaticallyImplyLeading: false,
            title: Text(
              bazaar.name.toString(),
              // style: theme.textTheme.h50,
            ),
            centerTitle: true,
            toolbarHeight: 100,
            flexibleSpace: bazaar.picture != null
                ? Container(
                    decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(bazaar.picture as String),
                        fit: BoxFit.cover),
                  ))
                : null,
          ),
          drawer: const CustomDrawer(),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    index.toString(),
                  ),
                  Text(
                    bazaar.id.toString(),
                  ),
                  Text(
                    bazaar.name.toString(),
                  ),
                  Text(
                    bazaar.message.toString(),
                  ),
                  Text(
                    bazaar.salesStart.toString(),
                  ),
                  Text(
                    bazaar.salesEnd.toString(),
                  ),
                  Text(
                    bazaar.eventFrom.toString(),
                  ),
                  Text(
                    bazaar.eventTo.toString(),
                  ),
                  Text(
                    bazaar.place.toString(),
                  ),
                  Text(
                    bazaar.picture.toString(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ElevatedButton(
                      //   child: const Text('複写'),
                      //   onPressed: () {
                      //     appRoute.push(const BazaarAddRoute());
                      //   },
                      // ),
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 5.0),
                      // ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: theme.appColors.primary,
                          onPrimary: theme.appColors.onPrimary,
                        ),
                        child: const Text('削除'),
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
                            viewModel.deleteBazaar(
                              bazaarId: bazaar.id.toString(),
                            );
                            appRoute.popUntilRoot();
                          } else {
                            // appRoute
                            //     .popAndPush(BazaarDetailsRouter(index: index));
                          }
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: theme.appColors.primary,
                          onPrimary: theme.appColors.onPrimary,
                        ),
                        child: const Text('更新'),
                        onPressed: () async {
                          appRoute.push(BazaarEditRoute(index: index));
                        },
                      ),
                    ],
                  ),
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
