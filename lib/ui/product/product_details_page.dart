import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/model/bazaar/bazaar_model.dart';
import 'package:flutter_application_1/data/repository/product/product_repository_impal.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../data/model/product/product_model.dart';
import '../../ui/order/order_view_model.dart';
import '../common/alertdialog.dart';
import '../common/show_dialog.dart';
import '../hooks/use_l10n.dart';
import '../hooks/use_router.dart';
import '../theme/app_theme.dart';
import 'product_view_model.dart';
import 'widget/picture.dart';

class ProductDetailsPage extends HookConsumerWidget {
  const ProductDetailsPage({
    Key? key,
    @PathParam('index') this.index,
    @PathParam('bazaar') this.bazaarEvent,
    @PathParam('product') this.productItem,
  }) : super(key: key);
  final index;
  final bazaarEvent;
  final productItem;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final appRoute = useRouter();
    final state = ref.watch(productViewModelProvider);
    final viewModel = ref.watch(productViewModelProvider.notifier);
    final asyncValue = ref.watch(productListStreamProvider);
    //
    // final NumberFormat numFormatter = NumberFormat.simpleCurrency(
    //     locale: Localizations.localeOf(context).toString());
    // final DateFormat dateFormatter =
    //     DateFormat.yMMMEd(Localizations.localeOf(context).toString());
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');

    //
    Product product;
    Bazaar bazaar;
    final staff = useState<bool>(false);
    final order = useState<bool>(false);
    final edit = useState<bool>(false);
    final update = useState<bool>(false);
    final add = useState<bool>(false);

    if (bazaarEvent == null) {
      order.value = true;
    } else {
      if (productItem != null) {
        update.value = true;
      } else {
        update.value = true;
        add.value = true;
        edit.value = true;
      }
    }

    if (productItem == null) {
      product = Product.empty();
    } else {
      product = productItem;
    }

    String? organizer;
    String? bazaarId;
    if (bazaarEvent == null) {
      bazaar = Bazaar.empty();
    } else {
      bazaar = bazaarEvent;
      organizer = bazaar.organizer;
      bazaarId = bazaar.id;
    }
    final form = GlobalKey<FormState>();
    const uid = 'test';
    DateTime now = DateTime.now();
    final quantity = useState<int>(1);

    final code = useTextEditingController(text: product.code);
    final name = useTextEditingController(text: product.name);
    final genre = useState(product.genre);
    final desc = useTextEditingController(text: product.desc);
    final stock = useTextEditingController(text: product.stock.toString());
    final price = useTextEditingController(text: product.price.toString());
    final expirationFrom = useTextEditingController(
        text: dateFormatter.format(product.expirationFrom != null
            ? product.expirationFrom as DateTime
            : now));
    final expirationTo = useTextEditingController(
        text: dateFormatter.format(product.expirationTo != null
            ? product.expirationTo as DateTime
            : now));
    final oldPicture = useTextEditingController(text: product.picture1URL);
    //
    final ImagePicker picker = ImagePicker();
    var uint8List = useState<Uint8List?>(null);
    return asyncValue.when(
      data: (data) {
        // final product = data.productList[index];
        final stockList = List.generate(
            int.parse(product.stock.toString()), (index) => 1 + index);

        return Scaffold(
          backgroundColor: theme.appColors.background,
          appBar: AppBar(
            backgroundColor: theme.appColors.primary,
            foregroundColor: theme.appColors.onPrimary,
            actions: [
              if (update.value && add.value == false)
                IconButton(
                    onPressed: () async {
                      // appRoute.pop();
                      var result = await customShowDialog(
                        context,
                        'delete',
                        'Do you want to delete it?',
                      );
                      if (result) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: theme.appColors.error,
                            content: const Text('Processing Data'),
                          ),
                        );
                        viewModel.deleteProduct(
                          productId: product.id.toString(),
                        );
                        appRoute.pop();
                      } else {}
                    },
                    icon: const Icon(Icons.delete)),
              if ((update.value && edit.value == false && add.value == false))
                IconButton(
                  onPressed: () async {
                    // appRoute.push(ProductEditRoute(index: index));
                    edit.value = true;
                  },
                  icon: const Icon(Icons.edit),
                ),
              if (edit.value && add.value == false)
                IconButton(
                  onPressed: () async {
                    if (form.currentState!.validate()) {
                      form.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Processing Data',
                            style: theme.textTheme.h30
                                .copyWith(color: theme.appColors.onError),
                          ),
                        ),
                      );
                      final updateProduct = product.copyWith(
                        organizer: uid,
                        code: code.text,
                        name: name.text,
                        genre: genre.value,
                        desc: desc.text,
                        stock: int.parse(stock.text),
                        price: int.parse(price.text),
                        expirationFrom: DateTime.parse(expirationFrom.text),
                        expirationTo: DateTime.parse(expirationTo.text),
                        isPublished: true,
                      );
                      viewModel.updateProduct(
                          updateProduct: updateProduct,
                          newPicture1: uint8List.value,
                          oldPicture1: oldPicture.text);
                      // appRoute.pop(ProductDetailsRoute(index: index));
                      appRoute.pop();
                      edit.value = false;
                    }
                  },
                  icon: const Icon(Icons.save),
                ),
              if (add.value)
                IconButton(
                  onPressed: () async {
                    if (form.currentState!.validate()) {
                      form.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Processing Data',
                            style: theme.textTheme.h30
                                .copyWith(color: theme.appColors.onError),
                          ),
                        ),
                      );
                      viewModel.addProduct(
                          organizer: organizer.toString(),
                          bazaarId: bazaarId.toString(),
                          register: uid,
                          code: code.text,
                          name: name.text,
                          genre: genre.value.toString(),
                          desc: desc.text,
                          stock: int.parse(stock.text),
                          price: int.parse(price.text),
                          expirationFrom: DateTime.parse(expirationFrom.text),
                          expirationTo: DateTime.parse(expirationTo.text),
                          isPublished: false,
                          picture1: (uint8List.value == null)
                              ? null
                              : (uint8List.value));
                      appRoute.pop();
                    }
                  },
                  icon: const Icon(Icons.save),
                ),
            ],
            title: Text(product.name.toString(),
                style: theme.textTheme.h50
                    .copyWith(color: theme.appColors.onPrimary)),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Form(
                  key: form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          if (edit.value) {
                            form.currentState!.save();
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.gallery);
                            uint8List.value = await image!.readAsBytes();
                          }
                        },
                        child: PictureDetail(
                          picture: uint8List.value,
                          oldPicture: oldPicture.text,
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              enabled: edit.value,
                              controller: code,
                              style:
                                  TextStyle(color: theme.appColors.onPrimary),
                              decoration:
                                  const InputDecoration(labelText: 'code'),
                              // validator: (value) {
                              // if (value == null || value.isEmpty) {
                              //   return 'Please enter some text';
                              // }
                              // return null;
                              // },
                              onSaved: (value) {
                                code.text = value.toString();
                              },
                              // onChanged: (value) {
                              // _name.text = value.toString();
                              // },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Flexible(
                            child: DropdownButtonFormField<String>(
                              items: ['Foods', 'Goods']
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ),
                                  )
                                  .toList(),
                              value: genre.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select';
                                }
                                return null;
                              },
                              decoration:
                                  const InputDecoration(labelText: 'genre'),
                              onChanged: edit.value
                                  ? (value) => {genre.value = value}
                                  : null,
                              onSaved: (value) => {genre.value = value},
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                      ),
                      TextFormField(
                        enabled: edit.value,
                        controller: name,
                        style: TextStyle(color: theme.appColors.onPrimary),
                        decoration: const InputDecoration(labelText: 'name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          name.text = value.toString();
                        },
                        // onChanged: (value) {
                        // _name.text = value.toString();
                        // },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                      ),
                      TextFormField(
                        enabled: edit.value,
                        controller: desc,
                        maxLines: 2,
                        style: TextStyle(color: theme.appColors.onPrimary),
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
                          desc.text = value.toString();
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              enabled: edit.value,
                              controller: stock,
                              style:
                                  TextStyle(color: theme.appColors.onPrimary),
                              decoration:
                                  const InputDecoration(labelText: 'stock'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                stock.text = value.toString();
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Flexible(
                            child: TextFormField(
                              enabled: edit.value,
                              controller: price,
                              style:
                                  TextStyle(color: theme.appColors.onPrimary),
                              decoration:
                                  const InputDecoration(labelText: 'price'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                price.text = value.toString();
                              },
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                      ),
                      //
                      Row(
                        children: [
                          (order.value || edit.value == false)
                              ? Text(
                                  '有効期間',
                                  style: theme.textTheme.h30.copyWith(
                                      color: theme.appColors.onPrimary),
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: theme.appColors.primary,
                                    onPrimary: theme.appColors.onPrimary,
                                  ),
                                  child: Text(
                                    '有効期間',
                                    style: theme.textTheme.h30.copyWith(
                                        color: theme.appColors.onPrimary),
                                  ),
                                  onPressed: () async {
                                    final dateRange = await showDateRangePicker(
                                      context: context,
                                      initialDateRange: DateTimeRange(
                                          start: DateTime.now(),
                                          end: DateTime.now()),
                                      firstDate: DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day),
                                      lastDate:
                                          DateTime(DateTime.now().year + 3),
                                    );
                                    if (dateRange != null) {
                                      expirationFrom.text =
                                          dateFormatter.format(dateRange.start);
                                      expirationTo.text =
                                          dateFormatter.format(dateRange.end);
                                    }
                                  },
                                ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          Flexible(
                            child: TextFormField(
                              enabled: false,
                              controller: expirationFrom,
                              style:
                                  TextStyle(color: theme.appColors.onPrimary),
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "From",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if (DateTime.parse(value).isAfter(
                                    DateTime.parse(expirationTo.text))) {
                                  return 'Please enter a date after the specified date';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                expirationFrom.text = value.toString();
                              },
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                          ),
                          Flexible(
                            child: TextFormField(
                              enabled: false,
                              controller: expirationTo,
                              style:
                                  TextStyle(color: theme.appColors.onPrimary),
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
                                expirationTo.text = value.toString();
                              },
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                      ),
                      if (order.value)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '数量：',
                              style: theme.textTheme.h30
                                  .copyWith(color: theme.appColors.onPrimary),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                            ),
                            DropdownButton<String>(
                              items: List.generate(
                                      int.parse(product.stock.toString()),
                                      (index) => 1 + index)
                                  .map(
                                    (quantity) => DropdownMenuItem<String>(
                                      value: quantity.toString(),
                                      child: Text(quantity.toString()),
                                    ),
                                  )
                                  .toList(),
                              value: quantity.value.toString(),
                              onChanged: (value) => {
                                quantity.value = int.parse(value.toString())
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: theme.appColors.primary,
                                onPrimary: theme.appColors.onPrimary,
                              ),
                              onPressed: product.stock == 0
                                  ? null
                                  : () async {
                                      // if(){};
                                      final isConfirmed = await showConfirmDialog(
                                          context,
                                          '${product.name} を購入しますか？\n数量 ${quantity.value}');
                                      // 購入処理
                                      if (isConfirmed) {
                                        try {
                                          // await model.createCharge(product);
                                          await ref
                                              .watch(orderViewModelProvider
                                                  .notifier)
                                              .addOrder(
                                                userId: uid,
                                                userName: '',
                                                organizer: product.organizer,
                                                bazaarId: product.bazaarId,
                                                bazaarName: product.bazaarName,
                                                code: product.code,
                                                name: product.name,
                                                desc: product.desc,
                                                price: product.price as int,
                                                quantity: quantity.value,
                                                numberOfUse: quantity.value,
                                                picture1URL:
                                                    product.picture1URL,
                                                picture2URL:
                                                    product.picture2URL,
                                                picture3URL:
                                                    product.picture3URL,
                                                expirationFrom:
                                                    product.expirationFrom,
                                                expirationTo:
                                                    product.expirationTo,
                                              );
                                          await showTextDialog(
                                              context, '購入しました');
                                        } catch (e) {
                                          await showTextDialog(
                                              context, e.toString());
                                        }
                                      }
                                    },
                              child: const Text('購入する'),
                            ),
                          ],
                        ),
                    ],
                  ),
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
