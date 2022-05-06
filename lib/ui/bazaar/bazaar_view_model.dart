import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/bazaar/bazaar_model.dart';
import '../../data/repository/bazaar/bazaar_repository.dart';
import '../../data/repository/bazaar/bazaar_repository_impal.dart';
import '../../data/repository/iamge/image_repository.dart';
import '../../data/repository/iamge/image_repository_impal.dart';
import 'bazaar_state.dart';

final bazzarViewModelProvider =
    StateNotifierProvider.autoDispose<BazaarViewModel, AsyncValue<BazaarState>>(
  (ref) => BazaarViewModel(ref: ref),
);

class BazaarViewModel extends StateNotifier<AsyncValue<BazaarState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  BazaarViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    readBazaar();
  }

  // repository
  late final BazaarRepository bazaarRepository =
      _ref.read(bazaarRepositoryProvider);
  late final ImageRepository imageRepository =
      _ref.read(imageRepositoryProvider);

  // 取得
  Future<void> readBazaar() async {
    final result = await bazaarRepository.readBazaar();
    result.when(
      success: (data) {
        state = AsyncValue.data(
          BazaarState(bazaarList: data),
        );
      },
      failure: (error) {
        state = AsyncValue.error(error);
      },
    );
  }

  // 追加
  Future<void> addBazaarEvent({
    required String organizer,
    required String name,
    required String message,
    required DateTime salesStart,
    required DateTime salesEnd,
    required DateTime eventFrom,
    required DateTime eventTo,
    required String place,
    required Uint8List? picture,
  }) async {
    final bazaar = Bazaar(
      organizer: organizer,
      name: name,
      message: message,
      salesStart: salesStart,
      salesEnd: salesEnd,
      eventFrom: eventFrom,
      eventTo: eventTo,
      place: place,
    );
    final bazaarId = await bazaarRepository.createBazaar(bazaar: bazaar);
    bazaarId.when(
      success: (id) async {
        final bazaarList = state.value!.bazaarList;
        state = AsyncValue.data(
          BazaarState(
            bazaarList: bazaarList
              ..add(
                bazaar.copyWith(id: id),
              ),
          ),
        );
        if (picture != null) {
          final image =
              await imageRepository.uploadImage(image: picture, id: id);
          image.when(
            success: (imagePath) {
              // bazaar.copyWith(id:id,picture: imagePath);
              updateBazaar(
                  updateBazaar: bazaar.copyWith(id: id, picture: imagePath));
            },
            failure: (error) {
              state = AsyncValue.error(error);
            },
          );
        }
      },
      failure: (error) {
        state = AsyncValue.error(error);
      },
    );
  }

  // 更新
  Future<void> updateBazaar({required Bazaar updateBazaar}) async {
    final result = await bazaarRepository.updateBazaar(bazaar: updateBazaar);
    result.when(
      success: (data) {
        final bazaars = state.value!.bazaarList;
        state = AsyncValue.data(
          BazaarState(
            bazaarList: [
              for (final bazaar in bazaars)
                if (bazaar.id == updateBazaar.id) updateBazaar else bazaar
            ],
          ),
        );
      },
      failure: (error) {
        state = AsyncValue.error(error);
      },
    );
  }

  //削除
  Future<void> deleteBazaar({required String bazaarId}) async {
    final result = await bazaarRepository.deleteBazaar(bazaarId: bazaarId);
    result.when(
      success: (data) async {
        final bazaarList = state.value!.bazaarList;
        for (var event in bazaarList) {
          if (event.id == bazaarId && event.picture != null) {
            final imageResult = await imageRepository.deleteImage(id: bazaarId);
            imageResult.when(
              success: (data) {},
              failure: (error) {
                state = AsyncValue.error(error);
              },
            );
          }
        }
        state = AsyncValue.data(
          BazaarState(
            bazaarList: bazaarList
              ..removeWhere((bazaarEvent) => bazaarEvent.id == bazaarId),
          ),
        );
      },
      failure: (error) {
        state = AsyncValue.error(error);
      },
    );
  }
}
