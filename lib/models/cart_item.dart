// Modelo de línea del carrito: producto + cantidad + subtotal.
import 'product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

    // Se calcula cuando se consulta, no se almacena como otro campo.

  double get subtotal => product.price * quantity;
}
