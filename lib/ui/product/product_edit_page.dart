import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../common/drawer.dart';
import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../routes/app_route.gr.dart';
import '../theme/app_theme.dart';
import 'product_view_model.dart';
import 'widget/picture.dart';

class ProductEditPage extends HookConsumerWidget {
  const ProductEditPage({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final appRoute = useRouter();
    final state = ref.watch(productViewModelProvider);
    final viewModel = ref.watch(productViewModelProvider.notifier);
    //
    final _form = GlobalKey<FormState>();
    DateTime _now = DateTime.now();
    String uid = 'test';

    //
    final ImagePicker _picker = ImagePicker();
    var _uint8List = useState<Uint8List?>(null);

    return state.when(
      data: (data) {
        final product = data.productList[index];
        final _name = useTextEditingController(text: product.name);
        final _genre = useState(product.genre);
        final _desc = useTextEditingController(text: product.desc);
        final _stock = useTextEditingController(text: product.stock.toString());
        final _price = useTextEditingController(text: product.price.toString());
        final _expirationFrom = useTextEditingController(
            text: dateFormat.format(product.expirationFrom != null
                ? product.expirationFrom as DateTime
                : _now));
        final _expirationTo = useTextEditingController(
            text: dateFormat.format(product.expirationTo != null
                ? product.expirationTo as DateTime
                : _now));

        final _oldPicture = useTextEditingController(text: product.picture1URL);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: theme.appColors.primary,
            foregroundColor: theme.appColors.onPrimary,
            // toolbarHeight: 30,
            title: Text(
              'Product Item',
              style: theme.textTheme.h40,
            ),
            centerTitle: true,
            leading: const AutoLeadingButton(),
            actions: [
              IconButton(
                onPressed: () async {
                  if (_form.currentState!.validate()) {
                    _form.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );

                    final updateProduct = product.copyWith(
                      organizer: uid,
                      name: _name.text,
                      genre: _genre.value,
                      desc: _desc.text,
                      stock: int.parse(_stock.text),
                      price: int.parse(_price.text),
                      expirationFrom: DateTime.parse(_expirationFrom.text),
                      expirationTo: DateTime.parse(_expirationTo.text),
                      isPublished: true,
                    );
                    viewModel.updateProduct(
                        updateProduct: updateProduct,
                        newPicture1: _uint8List.value,
                        oldPicture1: _oldPicture.text);
                    appRoute.pop(ProductDetailsRoute(index: index));
                  }
                },
                icon: const Icon(Icons.save),
              ),
            ],
          ),
          // Header(title: 'Event'),
          drawer: const CustomDrawer(),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              // child: BazaarForm(bazaar: product.empty()
              child: Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        _form.currentState!.save();
                        final XFile? _image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        _uint8List.value = await _image!.readAsBytes();
                      },
                      child: PictureDetail(
                        picture: _uint8List.value,
                        oldPicture: _oldPicture.text,
                      ),
                      // Container(
                      //     height: 100,
                      //     width: 160,
                      //     color: theme.appColors.primary,
                      //     alignment: Alignment.center,
                      //     child:
                      //  (ref.watch(imageCropProvider
                      //             .select((s) => s.croppedData)) ==
                      //         null)
                      //     ? (_oldPicture.text == '')
                      //         ? const Icon(Icons.add_photo_alternate)
                      //         : SizedBox.expand(
                      //             child: Image.network(_oldPicture.text))
                      //     : SizedBox.expand(
                      //         child: Image.memory(ref.watch(imageCropProvider
                      //                 .select((s) => s.croppedData))
                      //             as Uint8List),
                      //       ),
                      // ),
                    ),
                    TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(labelText: 'name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _name.text = value.toString();
                      },
                      // onChanged: (value) {
                      // _name.text = value.toString();
                      // },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    DropdownButtonFormField<String>(
                      items: ['Foods', 'Goods']
                          .map(
                            (item) => DropdownMenuItem<String>(
                              child: Text(item),
                              value: item,
                            ),
                          )
                          .toList(),
                      value: _genre.value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'genre'),
                      onChanged: (value) => {_genre.value = value},
                      onSaved: (value) => {_genre.value = value},
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    TextFormField(
                      controller: _desc,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'desc',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _desc.text = value.toString();
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    TextFormField(
                      controller: _stock,
                      decoration: const InputDecoration(labelText: 'stock'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _stock.text = value.toString();
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    TextFormField(
                      controller: _price,
                      decoration: const InputDecoration(labelText: 'price'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _price.text = value.toString();
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    //
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: theme.appColors.primary,
                            onPrimary: theme.appColors.onPrimary,
                          ),
                          child: const Text('有効期間'),
                          onPressed: () async {
                            final dateRange = await showDateRangePicker(
                              context: context,
                              initialDateRange: DateTimeRange(
                                  start: DateTime.now(), end: DateTime.now()),
                              firstDate: DateTime(DateTime.now().year,
                                  DateTime.now().month, DateTime.now().day),
                              lastDate: DateTime(DateTime.now().year + 3),
                            );
                            if (dateRange != null) {
                              _expirationFrom.text =
                                  dateFormat.format(dateRange.start);
                              _expirationTo.text =
                                  dateFormat.format(dateRange.end);
                            }
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: _expirationFrom,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "From",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              if (DateTime.parse(value).isAfter(
                                  DateTime.parse(_expirationTo.text))) {
                                return 'Please enter a date after the specified date';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _expirationFrom.text = value.toString();
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: _expirationTo,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "To",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _expirationTo.text = value.toString();
                            },
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                  ],
                ),
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
