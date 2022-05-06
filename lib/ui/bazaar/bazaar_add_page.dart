import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/bazaar/bazaar_details_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../gen/assets.gen.dart';
import '../common/header.dart';
import '../common/image_crop_controller.dart';
import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../theme/app_theme.dart';
import 'bazaar_view_model.dart';
import 'widget/bazaar_form.dart';

class BazaarAddPage extends HookConsumerWidget {
  const BazaarAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final appRoute = useRouter();
    final state = ref.watch(bazzarViewModelProvider);
    final viewModel = ref.watch(bazzarViewModelProvider.notifier);
    //
    final _form = GlobalKey<FormState>();
    DateTime _now = DateTime.now();
    String uid = 'test';
    final _name = useTextEditingController(
        text: ref.watch(bazaarDetailsProvider).bazaar?.name);
    final _message = useTextEditingController(
        text: ref.watch(bazaarDetailsProvider).bazaar?.message);
    final _salesStart = useTextEditingController(
        text: dateFormat.format(
            ref.watch(bazaarDetailsProvider).bazaar?.salesStart != null
                ? ref.watch(bazaarDetailsProvider).bazaar?.salesStart
                    as DateTime
                : _now));
    final _salesEnd = useTextEditingController(
        text: dateFormat.format(
            ref.watch(bazaarDetailsProvider).bazaar?.salesEnd != null
                ? ref.watch(bazaarDetailsProvider).bazaar?.salesEnd as DateTime
                : _now));
    final _eventFrom = useTextEditingController(
        text: dateFormat.format(
            ref.watch(bazaarDetailsProvider).bazaar?.eventFrom != null
                ? ref.watch(bazaarDetailsProvider).bazaar?.eventFrom as DateTime
                : _now));
    final _eventTo = useTextEditingController(
        text: dateFormat.format(
            ref.watch(bazaarDetailsProvider).bazaar?.eventTo != null
                ? ref.watch(bazaarDetailsProvider).bazaar?.eventTo as DateTime
                : _now));
    final _place = useTextEditingController(
        text: ref.watch(bazaarDetailsProvider).bazaar?.place);
    //
    final ImagePicker _picker = ImagePicker();
    Image _photoImage = Assets.img.flutterIcon.image();
    Uint8List? picture;
    if (ref.watch(imageCropProvider.select((s) => s.croppedData)) != null) {
      _photoImage = Image.memory(
        ref.watch(imageCropProvider.select((s) => s.croppedData)) as Uint8List,
        fit: BoxFit.cover,
      );
      picture = ref.watch(imageCropProvider.select((s) => s.croppedData))
          as Uint8List;
    }

    return state.when(
      data: (data) {
        return Scaffold(
          appBar: Header(title: 'Event'),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: BazaarForm(
                  //   key: _form,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       if (ref.watch(
                  //               imageCropProvider.select((s) => s.croppedData)) !=
                  //           null)
                  //         SizedBox(
                  //           height: 100,
                  //           child: _photoImage,
                  //         ),
                  //       // if (_photoImage != null) _photoImage,

                  //       const Padding(
                  //         padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 30.0),
                  //         child: Text(
                  //           'イベントの作成',
                  //           style: TextStyle(
                  //               fontSize: 20, fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //       TextFormField(
                  //         controller: _name,
                  //         decoration: const InputDecoration(labelText: 'title'),
                  //         validator: (value) {
                  //           if (value == null || value.isEmpty) {
                  //             return 'Please enter some text';
                  //           }
                  //           return null;
                  //         },
                  //         onSaved: (value) {
                  //           _name.text = value.toString();
                  //         },
                  //         onChanged: (value) {
                  //           // _name.text = value.toString();
                  //         },
                  //       ),
                  //       const Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 8.0),
                  //       ),
                  //       //
                  //       Row(
                  //         children: [
                  //           ElevatedButton(
                  //             child: const Text('販売期間'),
                  //             onPressed: () async {
                  //               final dateRange = await showDateRangePicker(
                  //                 context: context,
                  //                 initialDateRange: DateTimeRange(
                  //                     start: DateTime.now(), end: DateTime.now()),
                  //                 firstDate: DateTime(DateTime.now().year,
                  //                     DateTime.now().month, DateTime.now().day),
                  //                 lastDate: DateTime(DateTime.now().year + 3),
                  //               );
                  //               if (dateRange != null) {
                  //                 _salesStart.text =
                  //                     dateFormat.format(dateRange.start);
                  //                 _salesEnd.text = dateFormat.format(dateRange.end);
                  //               }
                  //             },
                  //           ),
                  //           const Padding(
                  //             padding: EdgeInsets.symmetric(horizontal: 5.0),
                  //           ),
                  //           Flexible(
                  //             child: TextFormField(
                  //               controller: _salesStart,
                  //               decoration: const InputDecoration(
                  //                 border: UnderlineInputBorder(),
                  //                 labelText: "From",
                  //               ),
                  //               validator: (value) {
                  //                 if (value == null || value.isEmpty) {
                  //                   return 'Please enter some text';
                  //                 }
                  //                 if (DateTime.parse(value)
                  //                     .isAfter(DateTime.parse(_eventFrom.text))) {
                  //                   return 'Please enter a date after the specified date';
                  //                 }
                  //                 return null;
                  //               },
                  //               onSaved: (value) {
                  //                 _salesStart.text = value.toString();
                  //                 // DateTime.parse(value) as TextEditingValue;
                  //               },
                  //             ),
                  //           ),
                  //           const Padding(
                  //             padding: EdgeInsets.symmetric(horizontal: 5.0),
                  //           ),
                  //           Flexible(
                  //             child: TextFormField(
                  //               controller: _salesEnd,
                  //               decoration: const InputDecoration(
                  //                 border: UnderlineInputBorder(),
                  //                 labelText: "To",
                  //               ),
                  //               validator: (value) {
                  //                 if (value == null || value.isEmpty) {
                  //                   return 'Please enter some text';
                  //                 }
                  //                 return null;
                  //               },
                  //               onSaved: (value) {
                  //                 _salesEnd.text = value.toString();
                  //                 // DateTime.parse(value) as TextEditingValue;
                  //               },
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       const Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 8.0),
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           ElevatedButton(
                  //             child: const Text('開催期間'),
                  //             onPressed: () async {
                  //               final dateRange = await showDateRangePicker(
                  //                 context: context,
                  //                 initialDateRange: DateTimeRange(
                  //                   start: DateTime.parse(_salesStart.text),
                  //                   end: DateTime.parse(_salesEnd.text),
                  //                 ),
                  //                 firstDate:
                  //                     DateTime(_now.year, _now.month, _now.day),
                  //                 lastDate: DateTime(_now.year + 3),
                  //               );
                  //               if (dateRange != null) {
                  //                 _eventFrom.text =
                  //                     dateFormat.format(dateRange.start).toString();
                  //                 _eventTo.text =
                  //                     dateFormat.format(dateRange.end).toString();
                  //               }
                  //             },
                  //           ),
                  //           const Padding(
                  //             padding: EdgeInsets.symmetric(horizontal: 5.0),
                  //           ),
                  //           Flexible(
                  //             child: TextFormField(
                  //               controller: _eventFrom,
                  //               decoration: const InputDecoration(
                  //                 border: UnderlineInputBorder(),
                  //                 labelText: "From",
                  //               ),
                  //               validator: (value) {
                  //                 if (value == null || value.isEmpty) {
                  //                   return 'Please enter some text';
                  //                 }
                  //                 return null;
                  //               },
                  //               onSaved: (value) {
                  //                 _eventFrom.text = value.toString();
                  //                 // DateTime.parse(value);
                  //               },
                  //             ),
                  //           ),
                  //           const Padding(
                  //             padding: EdgeInsets.symmetric(horizontal: 5.0),
                  //           ),
                  //           Flexible(
                  //             child: TextFormField(
                  //               controller: _eventTo,
                  //               decoration: const InputDecoration(
                  //                 border: UnderlineInputBorder(),
                  //                 labelText: "To",
                  //               ),
                  //               validator: (value) {
                  //                 if (value == null || value.isEmpty) {
                  //                   return 'Please enter some text';
                  //                 }
                  //                 if (DateTime.parse(_salesEnd.text)
                  //                     .isAfter(DateTime.parse(value))) {
                  //                   return 'Please enter a date after the specified date';
                  //                 }
                  //                 return null;
                  //               },
                  //               onSaved: (value) {
                  //                 _eventTo.text = value.toString();
                  //                 // DateTime.parse(value) as TextEditingValue;
                  //               },
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       const Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 8.0),
                  //       ),
                  //       TextFormField(
                  //         controller: _place,
                  //         decoration: const InputDecoration(labelText: 'place'),
                  //         validator: (value) {
                  //           if (value == null || value.isEmpty) {
                  //             return 'Please enter some text';
                  //           }
                  //           return null;
                  //         },
                  //         onSaved: (value) {
                  //           _place.text = value.toString();
                  //         },
                  //       ),
                  //       const Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 8.0),
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           ElevatedButton(
                  //             child: const Text('image'),
                  //             onPressed: () async {
                  //               _form.currentState!.save();
                  //               final XFile? _image = await _picker.pickImage(
                  //                   source: ImageSource.gallery);
                  //               await ref
                  //                   .read(imageCropProvider.notifier)
                  //                   .pickImage(_image);
                  //               await appRoute.push(const ImageCropRoute());
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //       const Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 8.0),
                  //       ),
                  //       TextFormField(
                  //         controller: _message,
                  //         maxLines: 2,
                  //         decoration: const InputDecoration(
                  //           border: OutlineInputBorder(),
                  //           labelText: 'message',
                  //         ),
                  //         validator: (value) {
                  //           if (value == null || value.isEmpty) {
                  //             return 'Please enter some text';
                  //           }
                  //           return null;
                  //         },
                  //         onSaved: (value) {
                  //           _message.text = value.toString();
                  //         },
                  //       ),
                  //       const Padding(
                  //         padding: EdgeInsets.symmetric(vertical: 8.0),
                  //       ),
                  //       ElevatedButton(
                  //         child: const Text('登録'),
                  //         onPressed: () async {
                  //           if (_form.currentState!.validate()) {
                  //             _form.currentState!.save();
                  //             ScaffoldMessenger.of(context).showSnackBar(
                  //               const SnackBar(content: Text('Processing Data')),
                  //             );
                  //             viewModel.addBazaarEvent(
                  //               organizer: uid,
                  //               name: _name.text,
                  //               message: _message.text,
                  //               salesStart: DateTime.parse(_salesStart.text),
                  //               salesEnd: DateTime.parse(_salesEnd.text),
                  //               eventFrom: DateTime.parse(_eventFrom.text),
                  //               eventTo: DateTime.parse(_eventTo.text),
                  //               place: _place.text,
                  //               picture: picture,
                  //             );
                  //             appRoute.pop(BazaarListPage);
                  //           }
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  ),
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
