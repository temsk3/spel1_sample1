import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../theme/app_theme.dart';

class Header extends ConsumerWidget with PreferredSizeWidget {
  Header({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return AppBar(
      title: Text(
        title,
        style: theme.textTheme.h50,
      ),
      centerTitle: true,
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      // const AutoBackButton(),
      backgroundColor: theme.appColors.primary,
      foregroundColor: theme.appColors.onPrimary,
      // toolbarHeight: 500,
      // flexibleSpace: Assets.img.cat.image(),
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(30),
      //     bottomRight: Radius.circular(30),
      //   ),
      // ),
    );
  }
}
