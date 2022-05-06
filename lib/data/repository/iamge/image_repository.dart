import 'dart:typed_data';

import '../../model/result/result.dart';

abstract class ImageRepository {
  // アイテムのリストを返す
  Future<Result<void>> readImagePath();
  // アイテムを保存する
  Future<Result<String>> uploadImage(
      {required Uint8List image, required String id});
  // アイテムを更新する
  // Future<Result<String>> updateImage(
  //     {required Uint8List image, required String id});
  // アイテムを削除する
  Future<Result<void>> deleteImage({required String id});
}
