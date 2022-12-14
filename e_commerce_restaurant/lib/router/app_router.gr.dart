// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<Type>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsRouteArgs>();
      return MaterialPageX<Type>(
        routeData: routeData,
        child: ProductDetailsScreen(
          product: args.product,
          key: args.key,
        ),
      );
    },
    CartRoute.name: (routeData) {
      return MaterialPageX<Type>(
        routeData: routeData,
        child: const CartScreen(),
      );
    },
    OrdersRoute.name: (routeData) {
      final args = routeData.argsAs<OrdersRouteArgs>();
      return MaterialPageX<Type>(
        routeData: routeData,
        child: OrdersScreen(
          productsIdInCart: args.productsIdInCart,
          totalSummary: args.totalSummary,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        RouteConfig(
          ProductDetailsRoute.name,
          path: '/productDetails',
        ),
        RouteConfig(
          CartRoute.name,
          path: '/cart',
        ),
        RouteConfig(
          OrdersRoute.name,
          path: '/orders',
        ),
      ];
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ProductDetailsScreen]
class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    required ProductData product,
    Key? key,
  }) : super(
          ProductDetailsRoute.name,
          path: '/productDetails',
          args: ProductDetailsRouteArgs(
            product: product,
            key: key,
          ),
        );

  static const String name = 'ProductDetailsRoute';
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    required this.product,
    this.key,
  });

  final ProductData product;

  final Key? key;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{product: $product, key: $key}';
  }
}

/// generated route for
/// [CartScreen]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/cart',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [OrdersScreen]
class OrdersRoute extends PageRouteInfo<OrdersRouteArgs> {
  OrdersRoute({
    required List<String> productsIdInCart,
    required double totalSummary,
    Key? key,
  }) : super(
          OrdersRoute.name,
          path: '/orders',
          args: OrdersRouteArgs(
            productsIdInCart: productsIdInCart,
            totalSummary: totalSummary,
            key: key,
          ),
        );

  static const String name = 'OrdersRoute';
}

class OrdersRouteArgs {
  const OrdersRouteArgs({
    required this.productsIdInCart,
    required this.totalSummary,
    this.key,
  });

  final List<String> productsIdInCart;

  final double totalSummary;

  final Key? key;

  @override
  String toString() {
    return 'OrdersRouteArgs{productsIdInCart: $productsIdInCart, totalSummary: $totalSummary, key: $key}';
  }
}
