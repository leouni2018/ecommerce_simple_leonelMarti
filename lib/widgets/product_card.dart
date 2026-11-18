// Widget reutilizable que presenta un producto y abre su detalle.
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../routes/app_routes.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          AppRoutes.detail,
          arguments: product.id,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              /*child: Container(
                width: double.infinity,
                color: product.color,
                child: Center(
                  child: CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.white70,
                    child: Icon(product.icon, size: 28, color: Colors.indigo),
                  ),
                ),
              ),*/
                  child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    product.imageAsset,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Respaldo visual si la ruta no existe o la imagen no carga.
                      return Container(
                        color: product.color,
                        child: Center(
                          child: Icon(product.icon, size: 42, color: Colors.indigo),
                        ),
                      );
                    },
                  ),
                ),

            ),
            
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.category,
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
