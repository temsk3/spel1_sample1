import 'package:auto_route/auto_route.dart';

import '../../ui/routes/route_path.dart';
import '../auth/auth.dart';
import '../bazaar/bazaar_add_page.dart';
import '../bazaar/bazaar_details_page.dart';
import '../bazaar/bazaar_edit_page.dart';
import '../bazaar/bazaar_page.dart';
import '../common/image_crop.dart';
import '../favorite/favorite_page.dart';
import '../home.dart';
import '../product/product_add_page.dart';
import '../product/product_details_page.dart';
import '../product/product_edit_page.dart';
import '../product/product_list_all.dart';
import '../product/product_list_foods.dart';
import '../product/product_list_goods.dart';
import '../product/product_page.dart';
import '../transaction/transaction_page.dart';
import '../xxx/xxx_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: RoutePath.appRouteHome,
      page: HomePage,
      initial: true,
      children: [
        // Product
        AutoRoute(
          path: RoutePath.appRouteProductList,
          name: 'ProductRouter',
          page: EmptyRouterPage,
          children: [
            RedirectRoute(
              path: RoutePath.appRouteAsterisk,
              redirectTo: RoutePath.appRouteBlanc,
            ),
            AutoRoute(
              path: RoutePath.appRouteBlanc,
              page: ProductPage,
              children: [
                AutoRoute(
                  path: RoutePath.appRouteProductAll,
                  page: ProductAllPage,
                ),
                AutoRoute(
                  path: RoutePath.appRouteProductFoods,
                  page: ProductFoodsPage,
                ),
                AutoRoute(
                  path: RoutePath.appRouteProductGoods,
                  page: ProductGoodsPage,
                ),
              ],
            ),
            AutoRoute(
              path: RoutePath.appRouteProductDetails,
              page: ProductDetailsPage,
            ),
            AutoRoute(
              path: RoutePath.appRouteProductEdit,
              page: ProductEditPage,
            ),
            AutoRoute(
              path: RoutePath.appRouteProductAdd,
              page: ProductAddPage,
            ),
          ],
        ),
        // Bazaar
        AutoRoute(
          path: RoutePath.appRouteBazaarList,
          name: 'BazaarListRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: RoutePath.appRouteBlanc,
              page: BazaarListPage,
            ),
            RedirectRoute(
              path: RoutePath.appRouteAsterisk,
              redirectTo: RoutePath.appRouteBlanc,
            ),
            AutoRoute(
              path: RoutePath.appRouteBazaarDetails,
              name: "BazaarDetailsRouter",
              page: BazaarDetailsPage,
            ),
            AutoRoute(
              path: RoutePath.appRouteBazaarEdit,
              page: BazaarEditPage,
            ),
            AutoRoute(
              path: RoutePath.appRouteBazaarAdd,
              name: "BazaarAddRouter",
              page: BazaarAddPage,
            ),
            // AutoRoute(
            //   path: RoutePath.appRouteBazaarAdd,
            //   name: "BazaarAddRouter",
            //   page: EmptyRouterPage,
            //   children: [
            //     AutoRoute(
            //       path: RoutePath.appRouteBlanc,
            //       page: BazaarAddPage,
            //     ),
            //     RedirectRoute(
            //       path: RoutePath.appRouteAsterisk,
            //       redirectTo: RoutePath.appRouteBlanc,
            //     ),
            AutoRoute(
              path: RoutePath.appRouteImageCrop,
              page: ImageCropPage,
            ),
            // ],
            // ),
          ],
        ),
        // AutoRoute(
        //   path: RoutePath.appRouteUser,
        //   page: UserPage,
        // ),
        // AutoRoute(
        //   path: RoutePath.appRoutePhoto,
        //   name: 'PickerRouter',
        //   page: EmptyRouterPage,
        //   children: [
        //     AutoRoute(
        //       path: RoutePath.appRouteBlanc,
        //       page: PickerPage,
        //     ),
        //     RedirectRoute(
        //       path: RoutePath.appRouteAsterisk,
        //       redirectTo: RoutePath.appRouteBlanc,
        //     ),
        //     AutoRoute(
        //       path: RoutePath.appRouteImageCrop,
        //       page: ImageCropPage,
        //     ),
        //   ],
        // ),
        AutoRoute(
          path: RoutePath.appRouteTicket,
          page: TransactionPage,
        ),
        AutoRoute(
          path: RoutePath.appRouteFavorite,
          page: FavoritePage,
        ),
        AutoRoute(
          path: RoutePath.appRouteAuth,
          page: AuthPage,
        ),
        AutoRoute(
          path: RoutePath.appRouteXXX,
          page: XXXPage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
