// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i19;
import 'package:flutter_application_1/ui/auth/auth.dart' as _i5;
import 'package:flutter_application_1/ui/bazaar/bazaar_add_page.dart' as _i17;
import 'package:flutter_application_1/ui/bazaar/bazaar_details_page.dart'
    as _i15;
import 'package:flutter_application_1/ui/bazaar/bazaar_edit_page.dart' as _i16;
import 'package:flutter_application_1/ui/bazaar/bazaar_page.dart' as _i14;
import 'package:flutter_application_1/ui/common/image_crop.dart' as _i18;
import 'package:flutter_application_1/ui/favorite/favorite_page.dart' as _i4;
import 'package:flutter_application_1/ui/home.dart' as _i1;
import 'package:flutter_application_1/ui/product/product_add_page.dart' as _i10;
import 'package:flutter_application_1/ui/product/product_details_page.dart'
    as _i8;
import 'package:flutter_application_1/ui/product/product_edit_page.dart' as _i9;
import 'package:flutter_application_1/ui/product/product_list_all.dart' as _i11;
import 'package:flutter_application_1/ui/product/product_list_foods.dart'
    as _i12;
import 'package:flutter_application_1/ui/product/product_list_goods.dart'
    as _i13;
import 'package:flutter_application_1/ui/product/product_page.dart' as _i7;
import 'package:flutter_application_1/ui/transaction/transaction_page.dart'
    as _i3;
import 'package:flutter_application_1/ui/xxx/xxx_page.dart' as _i6;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    ProductRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    BazaarListRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    TransactionRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.TransactionPage());
    },
    FavoriteRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.FavoritePage());
    },
    AuthRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.AuthPage());
    },
    XXXRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.XXXPage());
    },
    ProductRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.ProductPage());
    },
    ProductDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailsRouteArgs>(
          orElse: () =>
              ProductDetailsRouteArgs(index: pathParams.getInt('index')));
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i8.ProductDetailsPage(key: args.key, index: args.index));
    },
    ProductEditRoute.name: (routeData) {
      final args = routeData.argsAs<ProductEditRouteArgs>();
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i9.ProductEditPage(key: args.key, index: args.index));
    },
    ProductAddRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.ProductAddPage());
    },
    ProductAllRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i11.ProductAllPage());
    },
    ProductFoodsRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.ProductFoodsPage());
    },
    ProductGoodsRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.ProductGoodsPage());
    },
    BazaarListRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i14.BazaarListPage());
    },
    BazaarDetailsRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BazaarDetailsRouterArgs>(
          orElse: () =>
              BazaarDetailsRouterArgs(index: pathParams.getInt('index')));
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i15.BazaarDetailsPage(key: args.key, index: args.index));
    },
    BazaarEditRoute.name: (routeData) {
      final args = routeData.argsAs<BazaarEditRouteArgs>();
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i16.BazaarEditPage(key: args.key, index: args.index));
    },
    BazaarAddRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i17.BazaarAddPage());
    },
    ImageCropRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i18.ImageCropPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(HomeRoute.name, path: '/', children: [
          _i2.RouteConfig(ProductRouter.name,
              path: 'product',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig('*#redirect',
                    path: '*',
                    parent: ProductRouter.name,
                    redirectTo: '',
                    fullMatch: true),
                _i2.RouteConfig(ProductRoute.name,
                    path: '',
                    parent: ProductRouter.name,
                    children: [
                      _i2.RouteConfig(ProductAllRoute.name,
                          path: 'productAll', parent: ProductRoute.name),
                      _i2.RouteConfig(ProductFoodsRoute.name,
                          path: ':productFoods', parent: ProductRoute.name),
                      _i2.RouteConfig(ProductGoodsRoute.name,
                          path: ':productGoods', parent: ProductRoute.name)
                    ]),
                _i2.RouteConfig(ProductDetailsRoute.name,
                    path: ':productId', parent: ProductRouter.name),
                _i2.RouteConfig(ProductEditRoute.name,
                    path: 'productEdit', parent: ProductRouter.name),
                _i2.RouteConfig(ProductAddRoute.name,
                    path: 'roductAdd', parent: ProductRouter.name)
              ]),
          _i2.RouteConfig(BazaarListRouter.name,
              path: 'bazaar',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(BazaarListRoute.name,
                    path: '', parent: BazaarListRouter.name),
                _i2.RouteConfig('*#redirect',
                    path: '*',
                    parent: BazaarListRouter.name,
                    redirectTo: '',
                    fullMatch: true),
                _i2.RouteConfig(BazaarDetailsRouter.name,
                    path: ':bazaarId', parent: BazaarListRouter.name),
                _i2.RouteConfig(BazaarEditRoute.name,
                    path: 'bazaarEdit', parent: BazaarListRouter.name),
                _i2.RouteConfig(BazaarAddRouter.name,
                    path: 'bazaarAdd', parent: BazaarListRouter.name),
                _i2.RouteConfig(ImageCropRoute.name,
                    path: 'crop', parent: BazaarListRouter.name)
              ]),
          _i2.RouteConfig(TransactionRoute.name,
              path: 'ticket', parent: HomeRoute.name),
          _i2.RouteConfig(FavoriteRoute.name,
              path: 'favorite', parent: HomeRoute.name),
          _i2.RouteConfig(AuthRoute.name, path: 'auth', parent: HomeRoute.name),
          _i2.RouteConfig(XXXRoute.name, path: 'xxx', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class ProductRouter extends _i2.PageRouteInfo<void> {
  const ProductRouter({List<_i2.PageRouteInfo>? children})
      : super(ProductRouter.name, path: 'product', initialChildren: children);

  static const String name = 'ProductRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class BazaarListRouter extends _i2.PageRouteInfo<void> {
  const BazaarListRouter({List<_i2.PageRouteInfo>? children})
      : super(BazaarListRouter.name, path: 'bazaar', initialChildren: children);

  static const String name = 'BazaarListRouter';
}

/// generated route for
/// [_i3.TransactionPage]
class TransactionRoute extends _i2.PageRouteInfo<void> {
  const TransactionRoute() : super(TransactionRoute.name, path: 'ticket');

  static const String name = 'TransactionRoute';
}

/// generated route for
/// [_i4.FavoritePage]
class FavoriteRoute extends _i2.PageRouteInfo<void> {
  const FavoriteRoute() : super(FavoriteRoute.name, path: 'favorite');

  static const String name = 'FavoriteRoute';
}

/// generated route for
/// [_i5.AuthPage]
class AuthRoute extends _i2.PageRouteInfo<void> {
  const AuthRoute() : super(AuthRoute.name, path: 'auth');

  static const String name = 'AuthRoute';
}

/// generated route for
/// [_i6.XXXPage]
class XXXRoute extends _i2.PageRouteInfo<void> {
  const XXXRoute() : super(XXXRoute.name, path: 'xxx');

  static const String name = 'XXXRoute';
}

/// generated route for
/// [_i7.ProductPage]
class ProductRoute extends _i2.PageRouteInfo<void> {
  const ProductRoute({List<_i2.PageRouteInfo>? children})
      : super(ProductRoute.name, path: '', initialChildren: children);

  static const String name = 'ProductRoute';
}

/// generated route for
/// [_i8.ProductDetailsPage]
class ProductDetailsRoute extends _i2.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({_i19.Key? key, required int index})
      : super(ProductDetailsRoute.name,
            path: ':productId',
            args: ProductDetailsRouteArgs(key: key, index: index),
            rawPathParams: {'index': index});

  static const String name = 'ProductDetailsRoute';
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, required this.index});

  final _i19.Key? key;

  final int index;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i9.ProductEditPage]
class ProductEditRoute extends _i2.PageRouteInfo<ProductEditRouteArgs> {
  ProductEditRoute({_i19.Key? key, required int index})
      : super(ProductEditRoute.name,
            path: 'productEdit',
            args: ProductEditRouteArgs(key: key, index: index));

  static const String name = 'ProductEditRoute';
}

class ProductEditRouteArgs {
  const ProductEditRouteArgs({this.key, required this.index});

  final _i19.Key? key;

  final int index;

  @override
  String toString() {
    return 'ProductEditRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i10.ProductAddPage]
class ProductAddRoute extends _i2.PageRouteInfo<void> {
  const ProductAddRoute() : super(ProductAddRoute.name, path: 'roductAdd');

  static const String name = 'ProductAddRoute';
}

/// generated route for
/// [_i11.ProductAllPage]
class ProductAllRoute extends _i2.PageRouteInfo<void> {
  const ProductAllRoute() : super(ProductAllRoute.name, path: 'productAll');

  static const String name = 'ProductAllRoute';
}

/// generated route for
/// [_i12.ProductFoodsPage]
class ProductFoodsRoute extends _i2.PageRouteInfo<void> {
  const ProductFoodsRoute()
      : super(ProductFoodsRoute.name, path: ':productFoods');

  static const String name = 'ProductFoodsRoute';
}

/// generated route for
/// [_i13.ProductGoodsPage]
class ProductGoodsRoute extends _i2.PageRouteInfo<void> {
  const ProductGoodsRoute()
      : super(ProductGoodsRoute.name, path: ':productGoods');

  static const String name = 'ProductGoodsRoute';
}

/// generated route for
/// [_i14.BazaarListPage]
class BazaarListRoute extends _i2.PageRouteInfo<void> {
  const BazaarListRoute() : super(BazaarListRoute.name, path: '');

  static const String name = 'BazaarListRoute';
}

/// generated route for
/// [_i15.BazaarDetailsPage]
class BazaarDetailsRouter extends _i2.PageRouteInfo<BazaarDetailsRouterArgs> {
  BazaarDetailsRouter({_i19.Key? key, required int index})
      : super(BazaarDetailsRouter.name,
            path: ':bazaarId',
            args: BazaarDetailsRouterArgs(key: key, index: index),
            rawPathParams: {'index': index});

  static const String name = 'BazaarDetailsRouter';
}

class BazaarDetailsRouterArgs {
  const BazaarDetailsRouterArgs({this.key, required this.index});

  final _i19.Key? key;

  final int index;

  @override
  String toString() {
    return 'BazaarDetailsRouterArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i16.BazaarEditPage]
class BazaarEditRoute extends _i2.PageRouteInfo<BazaarEditRouteArgs> {
  BazaarEditRoute({_i19.Key? key, required int index})
      : super(BazaarEditRoute.name,
            path: 'bazaarEdit',
            args: BazaarEditRouteArgs(key: key, index: index));

  static const String name = 'BazaarEditRoute';
}

class BazaarEditRouteArgs {
  const BazaarEditRouteArgs({this.key, required this.index});

  final _i19.Key? key;

  final int index;

  @override
  String toString() {
    return 'BazaarEditRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i17.BazaarAddPage]
class BazaarAddRouter extends _i2.PageRouteInfo<void> {
  const BazaarAddRouter() : super(BazaarAddRouter.name, path: 'bazaarAdd');

  static const String name = 'BazaarAddRouter';
}

/// generated route for
/// [_i18.ImageCropPage]
class ImageCropRoute extends _i2.PageRouteInfo<void> {
  const ImageCropRoute() : super(ImageCropRoute.name, path: 'crop');

  static const String name = 'ImageCropRoute';
}
