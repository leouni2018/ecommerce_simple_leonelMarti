// Datos de demostración locales. No requiere conexión a Internet.
import 'package:flutter/material.dart';
import '../models/product.dart';

final List<Product> productsData = [
  Product(
    id: 1,
    name: 'Camiseta básica',
    description: 'Camiseta de algodón suave y cómoda, ideal para todos los días.',
    price: 19.99,
    category: 'Ropa',
    icon: Icons.checkroom,
    color: Colors.indigo.shade100,
        imageAsset: 'assets/images/camiseta_basica.jpg',
  ),
  Product(
    id: 2,
    name: 'Jeans clásicos',
    description: 'Jeans de corte recto, resistentes y con excelente ajuste.',
    price: 39.99,
    category: 'Ropa',
    icon: Icons.style,
    color: Colors.blue.shade100,
        imageAsset: 'assets/images/jeans_clasicos.jpg',
  ),
  Product(
    id: 3,
    name: 'Zapatillas urbanas',
    description:
        'Zapatillas cómodas y ligeras para el uso diario. Suela antideslizante y diseño moderno que combina con todo.',
    price: 59.99,
    category: 'Calzado',
    icon: Icons.directions_run,
    color: Colors.orange.shade100,
    imageAsset: 'assets/images/zapatillas_urbanas.jpg',

  ),
  Product(
    id: 4,
    name: 'Botas de cuero',
    description: 'Botas de cuero resistentes, perfectas para clima frío o lluvia.',
    price: 89.99,
    category: 'Calzado',
    icon: Icons.hiking,
    color: Colors.brown.shade100,
    imageAsset: 'assets/images/botas_cuero.jpg',
  ),
  Product(
    id: 5,
    name: 'Gorra deportiva',
    description: 'Gorra ajustable y transpirable para actividades al aire libre.',
    price: 14.99,
    category: 'Accesorios',
    icon: Icons.sports_baseball,
    color: Colors.green.shade100,
    imageAsset: 'assets/images/gorra_deportiva.jpg',
  ),
  Product(
    id: 6,
    name: 'Mochila urbana',
    description: 'Mochila con compartimento para laptop y múltiples bolsillos.',
    price: 34.99,
    category: 'Accesorios',
    icon: Icons.backpack,
    color: Colors.pink.shade100,
    imageAsset: 'assets/images/mochila_urbana.jpg',
  ),
];
