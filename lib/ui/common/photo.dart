// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// import '../hooks/use_router.dart';
// import '../routes/app_route.gr.dart';
// import 'picker_page_controller.dart';

// class PickerPage extends HookConsumerWidget {
//   const PickerPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final imageFile = ref.watch(pickerPageProvider.select((s) => s.imageFile));

//     Image _photoImage = Image.asset('assets/img/profile.jpg');
//     final appRoute = useRouter();
//     if (ref.watch(pickerPageProvider.select((s) => s.uint8list)) != null) {
//       final uint8list =
//           ref.watch(pickerPageProvider.select((s) => s.uint8list)) as Uint8List;
//       _photoImage = Image.memory(uint8list);
//       // if (kIsWeb) {
//       //   _photoImage = Image.network(imageFile.path);
//       // } else {
//       //   _photoImage = Image.file(File(imageFile.path));
//       // }
//     } else {}
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('image_picker'),
//       //   centerTitle: true,
//       // ),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Stack(
//                 children: [
//                   CircleAvatar(
//                     radius: 120,
//                     backgroundColor: Colors.black12,
//                     child: CircleAvatar(
//                       radius: 118,
//                       //もしimageFile(image_pickerで選択した画像)があれば、それを表示
//                       //無ければ、別の画像を表示
//                       backgroundImage: ref.watch(pickerPageProvider
//                                   .select((s) => s.uint8list)) !=
//                               null
//                           ? _photoImage.image
//                           : const AssetImage('assets/img/profile.jpg'),
//                     ),
//                   ),
//                   //RawMaterialButtonでCircleAvatarをtapできるようにしている
//                   RawMaterialButton(
//                     onPressed: () async {
//                       final image = await ImagePicker()
//                           .pickImage(source: ImageSource.gallery);
//                       await ref
//                           .read(pickerPageProvider.notifier)
//                           .pickImage(image);
//                     },
//                     child: const SizedBox(width: 240, height: 240),
//                     shape: const CircleBorder(),
//                     elevation: 0,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 5),
//               const Text(
//                 'タップして画像を選択しよう',
//                 style: TextStyle(fontSize: 15),
//               ),
//               ElevatedButton(
//                   onPressed: () async {
//                     await appRoute.push(const ImageCropRoute());
//                   },
//                   child: const Text('click')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
