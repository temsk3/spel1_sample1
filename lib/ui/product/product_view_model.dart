import 'dart:typed_data';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/product/product_model.dart';
import '../../data/repository/iamge/image_repository.dart';
import '../../data/repository/iamge/image_repository_impal.dart';
import '../../data/repository/product/product_repository.dart';
import '../../data/repository/product/product_repository_impal.dart';
import 'product_state.dart';

final productViewModelProvider = StateNotifierProvider.autoDispose<
    ProductViewModel, AsyncValue<ProductState>>(
  (ref) => ProductViewModel(ref: ref),
);

class ProductViewModel extends StateNotifier<AsyncValue<ProductState>> {
  final AutoDisposeStateNotifierProviderRef _ref;
  ProductViewModel({required AutoDisposeStateNotifierProviderRef ref})
      : _ref = ref,
        super(const AsyncLoading()) {
    readProduct();
  }

  // repository
  late final ProductRepository productRepository =
      _ref.read(productRepositoryProvider);
  late final ImageRepository imageRepository =
      _ref.read(imageRepositoryProvider);

  // 取得
  Future<void> readProduct() async {
    final result = await productRepository.readProduct();
    result.when(
      success: (data) {
        state = AsyncValue.data(
          ProductState(productList: data),
        );
      },
      failure: (error) {
        state = AsyncValue.error(error);
      },
    );
  }

  // 追加
  Future<void> addProductEvent({
    required String name,
    required String desc,
    required int stock,
    required int price,
    required DateTime expirationFrom,
    required DateTime expirationTo,
    required bool isActive,
    required Uint8List? picture,
  }) async {
    final product = Product(
      name: name,
      desc: desc,
      stock: stock,
      price: price,
      expirationFrom: expirationFrom,
      expirationTo: expirationTo,
      isActive: isActive,
    );
    final productId = await productRepository.createProduct(product: product);
    productId.when(
      success: (id) async {
        final productList = state.value!.productList;
        state = AsyncValue.data(
          ProductState(
            productList: productList
              ..add(
                product.copyWith(id: id),
              ),
          ),
        );
        if (picture != null) {
          final image =
              await imageRepository.uploadImage(image: picture, id: id);
          image.when(
            success: (imagePath) {
              // Product.copyWith(id:id,picture: imagePath);
              updateProduct(
                  updateProduct: product.copyWith(id: id, picture: imagePath));
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
  Future<void> updateProduct({required Product updateProduct}) async {
    final result =
        await productRepository.updateProduct(product: updateProduct);
    result.when(
      success: (data) {
        final products = state.value!.productList;
        state = AsyncValue.data(
          ProductState(
            productList: [
              for (final product in products)
                if (product.id == updateProduct.id) updateProduct else product
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
  Future<void> deleteProduct({required String productId}) async {
    final result = await productRepository.deleteProduct(productId: productId);
    result.when(
      success: (data) async {
        final productList = state.value!.productList;
        for (var event in productList) {
          if (event.id == productId && event.picture != null) {
            final imageResult =
                await imageRepository.deleteImage(id: productId);
            imageResult.when(
              success: (data) {},
              failure: (error) {
                state = AsyncValue.error(error);
              },
            );
          }
        }
        state = AsyncValue.data(
          ProductState(
            productList: productList
              ..removeWhere((product) => product.id == productId),
          ),
        );
      },
      failure: (error) {
        state = AsyncValue.error(error);
      },
    );
  }
}
