import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ui/routes/app_route.gr.dart';
import 'theme/app_theme.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return AutoTabsScaffold(
      backgroundColor: theme.appColors.background,
      // appBarBuilder: (_, tabsRouter) {
      //   return Header(title: 'Jumble Moll');
      // },
      homeIndex: 1,
      routes: const [
        ProductRouter(),
        BazaarListRouter(),
        FavoriteRoute(),
        TransactionRoute(),
        // ItemListRouter(),
        // XXXRoute(),
        // AuthRoute(),
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
              label: 'All Items',
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
              icon: const Icon(Icons.texture),
              label: 'Purchased Items',
              backgroundColor: theme.appColors.primary,
            ),
          ],
        );
      },
    );
  }
}
