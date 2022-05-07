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
import 'package:flutter/material.dart' as _i13;
import 'package:flutter_application_1/ui/auth/auth.dart' as _i5;
import 'package:flutter_application_1/ui/bazaar/bazaar_add_page.dart' as _i11;
import 'package:flutter_application_1/ui/bazaar/bazaar_details_page.dart'
    as _i10;
import 'package:flutter_application_1/ui/bazaar/bazaar_edit_page.dart' as _i9;
import 'package:flutter_application_1/ui/bazaar/bazaar_page.dart' as _i8;
import 'package:flutter_application_1/ui/common/image_crop.dart' as _i12;
import 'package:flutter_application_1/ui/favorite/favorite_page.dart' as _i4;
import 'package:flutter_application_1/ui/home.dart' as _i1;
import 'package:flutter_application_1/ui/product/product_page.dart' as _i7;
import 'package:flutter_application_1/ui/transaction/transaction_page.dart'
    as _i3;
import 'package:flutter_application_1/ui/xxx/xxx_page.dart' as _i6;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
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
    BazaarListRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.BazaarListPage());
    },
    BazaarEditRoute.name: (routeData) {
      final args = routeData.argsAs<BazaarEditRouteArgs>();
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i9.BazaarEditPage(key: args.key, index: args.index));
    },
    BazaarDetailsRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BazaarDetailsRouterArgs>(
          orElse: () =>
              BazaarDetailsRouterArgs(index: pathParams.getInt('index')));
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i10.BazaarDetailsPage(key: args.key, index: args.index));
    },
    BazaarAddRouter.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    BazaarAddRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i11.BazaarAddPage());
    },
    ImageCropRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i12.ImageCropPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(HomeRoute.name, path: '/', children: [
          _i2.RouteConfig(ProductRouter.name,
              path: 'product',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(ProductRoute.name,
                    path: '', parent: ProductRouter.name),
                _i2.RouteConfig('*#redirect',
                    path: '*',
                    parent: ProductRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i2.RouteConfig(BazaarListRouter.name,
              path: 'bazaar',
              parent: HomeRoute.name,
              children: [
                _i2.RouteConfig(BazaarListRoute.name,
                    path: '', parent: BazaarListRouter.name),
                _i2.RouteConfig(BazaarEditRoute.name,
                    path: 'bazaarEdit', parent: BazaarListRouter.name),
                _i2.RouteConfig(BazaarDetailsRouter.name,
                    path: ':bazaarId', parent: BazaarListRouter.name),
                _i2.RouteConfig('*#redirect',
                    path: '*',
                    parent: BazaarListRouter.name,
                    redirectTo: '',
                    fullMatch: true),
                _i2.RouteConfig(BazaarAddRouter.name,
                    path: 'bazaarAdd',
                    parent: BazaarListRouter.name,
                    children: [
                      _i2.RouteConfig(BazaarAddRoute.name,
                          path: '', parent: BazaarAddRouter.name),
                      _i2.RouteConfig('*#redirect',
                          path: '*',
                          parent: BazaarAddRouter.name,
                          redirectTo: '',
                          fullMatch: true),
                      _i2.RouteConfig(ImageCropRoute.name,
                          path: 'crop', parent: BazaarAddRouter.name)
                    ])
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
  const ProductRoute() : super(ProductRoute.name, path: '');

  static const String name = 'ProductRoute';
}

/// generated route for
/// [_i8.BazaarListPage]
class BazaarListRoute extends _i2.PageRouteInfo<void> {
  const BazaarListRoute() : super(BazaarListRoute.name, path: '');

  static const String name = 'BazaarListRoute';
}

/// generated route for
/// [_i9.BazaarEditPage]
class BazaarEditRoute extends _i2.PageRouteInfo<BazaarEditRouteArgs> {
  BazaarEditRoute({_i13.Key? key, required int index})
      : super(BazaarEditRoute.name,
            path: 'bazaarEdit',
            args: BazaarEditRouteArgs(key: key, index: index));

  static const String name = 'BazaarEditRoute';
}

class BazaarEditRouteArgs {
  const BazaarEditRouteArgs({this.key, required this.index});

  final _i13.Key? key;

  final int index;

  @override
  String toString() {
    return 'BazaarEditRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i10.BazaarDetailsPage]
class BazaarDetailsRouter extends _i2.PageRouteInfo<BazaarDetailsRouterArgs> {
  BazaarDetailsRouter({_i13.Key? key, required int index})
      : super(BazaarDetailsRouter.name,
            path: ':bazaarId',
            args: BazaarDetailsRouterArgs(key: key, index: index),
            rawPathParams: {'index': index});

  static const String name = 'BazaarDetailsRouter';
}

class BazaarDetailsRouterArgs {
  const BazaarDetailsRouterArgs({this.key, required this.index});

  final _i13.Key? key;

  final int index;

  @override
  String toString() {
    return 'BazaarDetailsRouterArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i2.EmptyRouterPage]
class BazaarAddRouter extends _i2.PageRouteInfo<void> {
  const BazaarAddRouter({List<_i2.PageRouteInfo>? children})
      : super(BazaarAddRouter.name,
            path: 'bazaarAdd', initialChildren: children);

  static const String name = 'BazaarAddRouter';
}

/// generated route for
/// [_i11.BazaarAddPage]
class BazaarAddRoute extends _i2.PageRouteInfo<void> {
  const BazaarAddRoute() : super(BazaarAddRoute.name, path: '');

  static const String name = 'BazaarAddRoute';
}

/// generated route for
/// [_i12.ImageCropPage]
class ImageCropRoute extends _i2.PageRouteInfo<void> {
  const ImageCropRoute() : super(ImageCropRoute.name, path: 'crop');

  static const String name = 'ImageCropRoute';
}
