// Estado global del catálogo: búsqueda, categorías y consulta por ID.
import 'package:flutter/foundation.dart';
import '../data/products_data.dart';
import '../models/product.dart';

class CatalogProvider extends ChangeNotifier {
  String _query = '';
  String _category = 'Todos';

  String get category => _category;

  List<String> get categories =>
      ['Todos', ...productsData.map((p) => p.category).toSet()];

  // Combina el filtro por categoría y el texto introducido en el buscador.
  List<Product> get products {
    return productsData.where((p) {
      final matchesCategory = _category == 'Todos' || p.category == _category;
      final matchesQuery =
          p.name.toLowerCase().contains(_query.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();
  }

  Product? findById(int id) {
    for (final p in productsData) {
      if (p.id == id) return p;
    }
    return null;
  }

  // Actualiza el criterio de búsqueda y notifica a los widgets suscritos.
  void setQuery(String value) {
    _query = value;
    notifyListeners();
  }

  void setCategory(String value) {
    _category = value;
    notifyListeners();
  }
}
