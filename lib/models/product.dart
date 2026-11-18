// Modelo de dominio: representa un producto del catálogo.
import 'package:flutter/material.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String category;
  final IconData icon;
  final Color color;
  final String imageAsset; // Ruta de la imagen local del producto.

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.icon,
    required this.color,
    required this.imageAsset,
  });
}
