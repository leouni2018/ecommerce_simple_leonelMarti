// Detalle del producto: recibe el ID por argumentos de navegación.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/catalog_provider.dart';
import '../routes/app_routes.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    // El id llega como argumento de la ruta (Navigator.pushNamed).
    // Recupera el ID enviado desde ProductCard mediante pushNamed.
    final productId = ModalRoute.of(context)!.settings.arguments as int;
    final product = context.read<CatalogProvider>().findById(productId);

    if (product == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detalle')),
        body: const Center(child: Text('Producto no encontrado')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Detalle')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          /*  Container(
              height: 280,
              width: double.infinity,
              color: product.color,
              child: Center(
                child: CircleAvatar(
                  radius: 62,
                  backgroundColor: Colors.white70,
                  child: Icon(product.icon, size: 60, color: Colors.indigo),
                ),
              ),
            ),*/
               SizedBox(
                height: 280,
                width: double.infinity,
                child: Image.asset(
                  product.imageAsset,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: product.color,
                      child: Center(
                        child: Icon(product.icon, size: 60, color: Colors.indigo),
                      ),
                    );
                  },
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      Chip(label: Text(product.category)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Descripción',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(product.description,
                      style: TextStyle(color: Colors.grey.shade700)),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Cantidad',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          IconButton.outlined(
                            onPressed: _quantity > 1
                                ? () => setState(() => _quantity--)
                                : null,
                            icon: const Icon(Icons.remove),
                          ),
                          SizedBox(
                            width: 40,
                            child: Text('$_quantity',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          IconButton.filled(
                            onPressed: () => setState(() => _quantity++),
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton(
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(52),
              backgroundColor: Colors.indigo,
            ),
            onPressed: () {
              context.read<CartProvider>().add(product, quantity: _quantity);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$_quantity x ${product.name} agregado'),
                  action: SnackBarAction(
                    label: 'VER CARRITO',
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.cart),
                  ),
                ),
              );
            },
            child: const Text('Agregar al carrito',
                style: TextStyle(fontSize: 16)),
          ),
        ),
      ),
    );
  }
}
