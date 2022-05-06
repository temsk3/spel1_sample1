import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../theme/app_theme.dart';

class ItemAddPage extends HookConsumerWidget {
  const ItemAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final appRoute = useRouter();

    return Scaffold(
      // appBar: Header(title: l10n.productdetails),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'product add',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
