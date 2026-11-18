// Estado global del carrito. notifyListeners() actualiza las pantallas suscritas.
import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  bool get isEmpty => _items.isEmpty;

  /// Total de unidades (se muestra en el badge del carrito).
  int get totalCount =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get total =>
      _items.values.fold(0.0, (sum, item) => sum + item.subtotal);

  // Agrega el producto o acumula unidades si ya existe en el carrito.
  void add(Product product, {int quantity = 1}) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += quantity;
    } else {
      _items[product.id] = CartItem(product: product, quantity: quantity);
    }
    notifyListeners();
  }

  void increment(int productId) {
    _items[productId]?.quantity++;
    notifyListeners();
  }

  // Reduce una unidad; si llega a cero, elimina la línea del carrito.
  void decrement(int productId) {
    final item = _items[productId];
    if (item == null) return;
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void remove(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  // Vacía el carrito después de confirmar el pedido.
  void clear() {
    _items.clear();
    notifyListeners();
  }
}
