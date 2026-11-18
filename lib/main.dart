// Punto de entrada. Registra Provider y configura tema y navegación.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/catalog_provider.dart';
import 'routes/app_routes.dart';

void main() {
  // MultiProvider permite compartir el catálogo y el carrito entre pantallas.
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CatalogProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Tienda Virtual',
      
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 100, 70, 177),
          foregroundColor: Color.fromARGB(188, 231, 225, 225),
        ),
      ),
      initialRoute: AppRoutes.home, // Pantalla inicial
      routes: AppRoutes.routes, // Solo se llama el archivo de rutas

      
    );
  }
}
