import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/model/bazaar/bazaar_model.dart';
import '../../hooks/use_l10n.dart';
import '../../hooks/use_router.dart';
import '../../routes/app_route.gr.dart';
import '../../theme/app_text_theme.dart';
import '../../theme/app_theme.dart';
import '../bazaar_view_model.dart';

class EventCard extends HookConsumerWidget {
  EventCard({Key? key, required this.index, required this.bazaar})
      : super(key: key);
  int index;
  Bazaar bazaar;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final appRoute = useRouter();
    final viewModel = ref.watch(bazzarViewModelProvider.notifier);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(10.0),
      elevation: 30.0,
      child: Column(
        children: [
          ListTile(
            dense: true,
            leading: Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(10),
                image: bazaar.pictureURL != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(bazaar.pictureURL as String),
                      )
                    : null,
              ),
              child: bazaar.pictureURL == null
                  ? const Center(
                      child: Text('NoImage'),
                    )
                  : null,
            ),
            title: Row(
              children: [
                Text(
                  bazaar.name.toString(),
                  style: theme.textTheme.h30.bold(),
                ),
              ],
            ),
            subtitle:
                Text(bazaar.message.toString(), style: theme.textTheme.h10),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              appRoute.push(BazaarDetailsRouter(index: index));
            },
          ),
        ],
      ),
    );
  }
}
