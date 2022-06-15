import 'package:auto_route/auto_route.dart';

import '../../ui/routes/route_path.dart';
import '../auth/start_page.dart';
import '../bazaar/bazaar_add_page.dart';
import '../bazaar/bazaar_details_page.dart';
import '../bazaar/bazaar_edit_page.dart';
import '../bazaar/bazaar_page.dart';
import '../common/image_crop.dart';
import '../favorite/favorite_page.dart';
import '../home.dart';
import '../order/order_page.dart';
import '../order/product_status_page.dart';
import '../order/purchase_page.dart';
import '../order/sales_status_page.dart';
import '../product/product_add_page.dart';
import '../product/product_details_page.dart';
import '../product/product_edit_page.dart';
import '../product/product_list_all.dart';
import '../product/product_list_foods.dart';
import '../product/product_list_goods.dart';
import '../product/product_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: RoutePath.appRouteHome,
      page: HomePage,
      initial: true,
      children: [
        // Auth
        AutoRoute(
          path: RoutePath.appRouteAuth,
          page: StartPage,
        ),
        // User
        // AutoRoute(
        //   path: RoutePath.appRouteUser,
        //   page: UserPage,
        // ),
        // AutoRoute(
        //   path: RoutePath.appRouteProfire,
        //   page: ProfilePage,
        // ),
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
              page: BazaarDetailsPage,
            ),
            AutoRoute(
              path: RoutePath.appRouteBazaarEdit,
              page: BazaarEditPage,
            ),
            AutoRoute(
              path: RoutePath.appRouteBazaarAdd,
              page: BazaarAddPage,
            ),
            AutoRoute(
              path: RoutePath.appRouteImageCrop,
              page: ImageCropPage,
            ),
            //
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
            //
            AutoRoute(
              path: RoutePath.appRouteOrder,
              page: OrderPage,
            ),
            AutoRoute(
              path: RoutePath.appRouteSalesStatus,
              page: SalesStatusPage,
            ),
            AutoRoute(
              path: RoutePath.appRouteProductStatus,
              page: ProductStatusPage,
            ),
          ],
        ),
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
        // Order
        AutoRoute(
          path: RoutePath.appRoutePurchase,
          page: PurchasePage,
        ),
        AutoRoute(
          path: RoutePath.appRouteOrder,
          page: OrderPage,
        ),
        AutoRoute(
          path: RoutePath.appRouteSalesStatus,
          page: SalesStatusPage,
        ),
        AutoRoute(
          path: RoutePath.appRouteProductStatus,
          page: ProductStatusPage,
        ),
        // Favorite
        AutoRoute(
          path: RoutePath.appRouteFavorite,
          page: FavoritePage,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
