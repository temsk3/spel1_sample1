import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/hooks/use_media_query.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ui/routes/app_route.gr.dart';
import 'common/drawer.dart';
import 'hooks/use_router.dart';
import 'theme/app_theme.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final appRoute = useRouter();
    final appMQ = useMediaQuery();

    return WillPopScope(
      onWillPop: () => _finishNextPage(),
      child: AutoTabsScaffold(
        backgroundColor: theme.appColors.background,
        appBarBuilder: (_, tabsRouter) {
          return AppBar(
            backgroundColor: theme.appColors.primary,
            foregroundColor: theme.appColors.onPrimary,
            elevation: 0,
            // title: const Text(
            //   'Jumble Moll',
            //   // style: theme.textTheme.h50,
            // ),
            centerTitle: true,
            leading: AutoLeadingButton(
              color: theme.appColors.onPrimary,
            ),
            actions: const [],
          );
        },
        // drawer: const CustomDrawer(),
        drawer: appMQ.size.width <= 768 ? const CustomDrawer() : null,
        homeIndex: 1,
        routes: const [
          ProductRouter(),
          BazaarListRouter(),
          FavoriteRoute(),
          PurchaseRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            backgroundColor: theme.appColors.primary,
            selectedIconTheme:
                IconThemeData(size: 30, color: theme.appColors.onPrimary),
            selectedItemColor: theme.appColors.onPrimary,
            unselectedIconTheme:
                IconThemeData(size: 25, color: theme.appColors.onPrimary),
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_basket),
                label: 'Item List',
                backgroundColor: theme.appColors.primary,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.event),
                label: 'Event List',
                backgroundColor: theme.appColors.primary,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.bookmark),
                label: 'Favorite',
                backgroundColor: theme.appColors.primary,
              ),
              BottomNavigationBarItem(
                // icon: const Icon(Icons.texture),
                icon: const FaIcon(FontAwesomeIcons.ticketSimple),
                label: 'Purchased Items',
                backgroundColor: theme.appColors.primary,
              ),
            ],
          );
        },
      ),
    );
  }
}

Future<bool> _finishNextPage() async {
  return false;
}
