import 'package:auto_route/auto_route.dart';

import '../../ui/routes/route_path.dart';
import '../auth/auth.dart';
import '../bazaar/bazaar_add_page.dart';
import '../bazaar/bazaar_details_page.dart';
import '../bazaar/bazaar_page.dart';
import '../common/image_crop.dart';
import '../favorite/favorite_page.dart';
import '../home.dart';
import '../item/item_add_page.dart';
import '../item/item_details_page.dart';
import '../item/item_page.dart';
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
        // Item
        AutoRoute(
          path: RoutePath.appRouteItemList,
          name: 'ItemListRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: RoutePath.appRouteBlanc,
              page: ItemListPage,
            ),
            AutoRoute(
              path: RoutePath.appRouteItemDetails,
              page: ItemDetailsPage,
            ),
            RedirectRoute(
              path: RoutePath.appRouteAsterisk,
              redirectTo: RoutePath.appRouteBlanc,
            ),
            AutoRoute(
              path: RoutePath.appRouteItemAdd,
              page: ItemAddPage,
            ),
          ],
        ),
        // Product
        AutoRoute(
          path: RoutePath.appRouteProductList,
          name: 'ProductRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: RoutePath.appRouteBlanc,
              page: ProductPage,
            ),
            // AutoRoute(
            //   path: RoutePath.appRouteProductDetails,
            //   page: ProductDetailsPage,
            // ),
            RedirectRoute(
              path: RoutePath.appRouteAsterisk,
              redirectTo: RoutePath.appRouteBlanc,
            ),
            // AutoRoute(
            //   path: RoutePath.appRouteProductmAdd,
            //   page: ProductAddPage,
            // ),
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
            // AutoRoute(
            //   path: RoutePath.appRouteBazaarDetails,
            //   name: "BazaarDetailsRouter",
            //   page: BazaarDetailsPage,
            // children: [
            //   AutoRoute(
            //     path: RoutePath.appRouteBazaarUpdate,
            //     page: BazaarUpdatePage,
            //   ),
            // ],
            // ),
            AutoRoute(
              path: RoutePath.appRouteBazaarDetails,
              name: "BazaarDetailsRouter",
              page: BazaarDetailsPage,
            ),
            RedirectRoute(
              path: RoutePath.appRouteAsterisk,
              redirectTo: RoutePath.appRouteBlanc,
            ),
            AutoRoute(
              path: RoutePath.appRouteBazaarAdd,
              name: "BazaarAddRouter",
              page: EmptyRouterPage,
              children: [
                AutoRoute(
                  path: RoutePath.appRouteBlanc,
                  page: BazaarAddPage,
                ),
                RedirectRoute(
                  path: RoutePath.appRouteAsterisk,
                  redirectTo: RoutePath.appRouteBlanc,
                ),
                AutoRoute(
                  path: RoutePath.appRouteImageCrop,
                  page: ImageCropPage,
                ),
              ],
            ),
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
