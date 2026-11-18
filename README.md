# E-commerce sencillo en Flutter

Proyecto replicado a partir de la guía adjunta del curso **Desarrollo Frontend multiplataforma con Flutter** del Centro Tecnológico Francisco “El Chele” Moreno.

## Funcionalidades

1. Inicio / catálogo: seis productos de demostración, búsqueda y filtros por categoría.
2. Detalle: consulta por ID, selector de cantidad y agregado al carrito.
3. Carrito: listado, incremento, decremento, eliminación y total.
4. Checkout: validación de datos, método de pago, resumen y confirmación del pedido.

## Arquitectura

- `models/`: modelos `Product` y `CartItem`.
- `data/`: catálogo local de demostración.
- `providers/`: estado compartido con Provider.
- `routes/`: rutas nombradas del Navigator.
- `screens/`: las cuatro pantallas.
- `widgets/`: tarjeta reutilizable de producto.

El código incluye comentarios en español para explicar la responsabilidad de archivos, clases y operaciones centrales.

## Requisitos

- Flutter SDK 3.19 o superior (recomendado Flutter 3.x reciente).
- Dart compatible con Flutter.
- Visual Studio Code con las extensiones **Dart** y **Flutter**.
- Chrome, emulador Android o dispositivo conectado.

Verifica el entorno:

```bash
flutter doctor
flutter --version
```

## Abrir en Visual Studio Code

1. Descomprime `ecommerce_simple.zip`.
2. Abre Visual Studio Code.
3. Selecciona **File > Open Folder**.
4. Abre la carpeta `ecommerce_simple` (la carpeta que contiene `pubspec.yaml`).
5. Abre la terminal integrada: **Terminal > New Terminal**.

## Instalar dependencias y ejecutar

```bash
flutter pub get
flutter devices
flutter run -d chrome
```

Para ejecutar en Android, inicia un emulador o conecta un teléfono con depuración USB y ejecuta:

```bash
flutter run
```

## Pruebas manuales

- [ ] El catálogo muestra seis productos.
- [ ] La búsqueda filtra por nombre.
- [ ] Los chips filtran por categoría.
- [ ] La tarjeta abre el detalle del producto correcto.
- [ ] El detalle permite cambiar la cantidad.
- [ ] Agregar al carrito actualiza el contador.
- [ ] En el carrito se puede incrementar, disminuir y eliminar.
- [ ] El total se recalcula correctamente.
- [ ] El checkout exige nombre, dirección y teléfono.
- [ ] Confirmar muestra el número de pedido y el total pagado.
- [ ] Al confirmar, el carrito queda vacío.

## Alcance y consideraciones didácticas

Esta versión reproduce el alcance de la guía fuente: catálogo local, navegación y carrito en memoria. No incorpora todavía base de datos, autenticación, pasarela de pago, backend ni persistencia de pedidos. El número de pedido se genera de forma aleatoria para la demostración; no representa una transacción real.

Los precios de demostración se conservan en dólares, tal como aparecen en la guía original.
