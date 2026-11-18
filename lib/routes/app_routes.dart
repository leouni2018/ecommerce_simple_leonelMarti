// Centraliza los nombres y constructores de las pantallas de la aplicación.
import 'package:flutter/material.dart';
import '../screens/cart_screen.dart';
import '../screens/checkout_screen.dart';
import '../screens/home_screen.dart';
import '../screens/product_detail_screen.dart';

class AppRoutes {
  // Nombres de las rutas
  static const String home = '/';
  static const String detail = '/detalle';
  static const String cart = '/carrito';
  static const String checkout = '/checkout';

  // Mapa de rutas
  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    detail: (context) => const ProductDetailScreen(),
    cart: (context) => const CartScreen(),
    checkout: (context) => const CheckoutScreen(),
  };
}
