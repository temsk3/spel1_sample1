import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/bazaar/bazaar_model.dart';

part 'bazaar_details_state.freezed.dart';

@freezed
class BazaarDetailsState with _$BazaarDetailsState {
  const factory BazaarDetailsState({
    Bazaar? bazaar,
  }) = _BazaarDetailsState;
}

final bazaarDetailsProvider = StateNotifierProvider.autoDispose<
    BazaarDetailsController, BazaarDetailsState>((ref) {
  return BazaarDetailsController();
});

class BazaarDetailsController extends StateNotifier<BazaarDetailsState> {
  BazaarDetailsController() : super(const BazaarDetailsState());

  Future<void> setDetail(Bazaar bazaar) async {
    state = state.copyWith(bazaar: bazaar);
  }
}
