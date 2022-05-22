import 'dart:typed_data';

import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../hooks/use_router.dart';
import '../theme/app_theme.dart';
import 'image_crop_controller.dart';

class ImageCropPage extends HookConsumerWidget {
  const ImageCropPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _controller = CropController();
    final theme = ref.watch(appThemeProvider);
    final appRoute = useRouter();

    final _state = ref.watch(imageCropProvider);
    final _vm = ref.watch(imageCropProvider.notifier);
    final _photoImage = _state.uint8list as Uint8List;

    var _isProcessing = false;
    Uint8List? _croppedData = _state.croppedData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appColors.primary,
        title: Text(
          'Image Crop',
          style: TextStyle(color: theme.appColors.onPrimary),
        ),
        centerTitle: true,
        actions: [
          if (_croppedData == null)
            IconButton(
              icon: const Icon(Icons.cut),
              onPressed: () {
                _vm.isProcessing(true);
                _controller.crop();
              },
            ),
          if (_croppedData != null)
            IconButton(
              icon: const Icon(Icons.redo),
              onPressed: () => _vm.croppedData(null),
            ),
          if (_croppedData != null)
            IconButton(
                onPressed: () {
                  _vm.saveImage(_croppedData);
                  appRoute.pop();
                },
                icon: const Icon(Icons.save))
        ],
        iconTheme: IconThemeData(color: theme.appColors.onPrimary),
      ),
      body: Visibility(
        visible: _croppedData == null,
        child: Crop(
            controller: _controller,
            image: _photoImage,
            onCropped: (cropped) {
              _vm.croppedData(cropped);
              _vm.isProcessing(false);
            },
            aspectRatio: 3 / 1,
            initialSize: 0.8,
            cornerDotBuilder: (size, edge) => DotControl(
                  color: {
                    EdgeAlignment.topLeft: Colors.white,
                    EdgeAlignment.topRight: Colors.white,
                    EdgeAlignment.bottomRight: Colors.white,
                    EdgeAlignment.bottomLeft: Colors.white,
                  }[edge]!,
                ),
            maskColor: Colors.grey.shade300.withAlpha(200),
            baseColor: Colors.grey
            // withCircleUi: true,
            ),
        replacement: _croppedData != null
            ? Container(
                padding: const EdgeInsets.all(16),
                height: double.infinity,
                width: double.infinity,
                child: Image.memory(
                  _croppedData,
                  fit: BoxFit.contain,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
