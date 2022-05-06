import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/bazaar/widget/bazaar_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../common/header.dart';
import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../theme/app_theme.dart';
import 'bazaar_view_model.dart';

class BazaarUpdatePage extends HookConsumerWidget {
  const BazaarUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final appRoute = useRouter();
    final state = ref.watch(bazzarViewModelProvider);
    final viewModel = ref.watch(bazzarViewModelProvider.notifier);
    //
    return state.when(
      data: (data) {
        return Scaffold(
          appBar: Header(title: 'Event'),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: BazaarForm(),
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
