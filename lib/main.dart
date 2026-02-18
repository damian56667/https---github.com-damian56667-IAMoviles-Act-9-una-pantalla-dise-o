import 'package:flutter/material.dart';

void main() => runApp(const NFApp());

class NFApp extends StatelessWidget {
  const NFApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NFHomePage(),
    );
  }
}

class NFHomePage extends StatelessWidget {
  const NFHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título con fondo AMARILLO, logo, carrito y menú de 3 rayas
              Container(
                width: double.infinity,
                color: const Color(0xFFFFE600), // Fondo amarillo
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Logo (mini imagen)
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text('NF', 
                          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 16)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    
                    // Título en dos líneas - CON TILDE
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('NUESTRAS', 
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1)),
                        Text('FRAGANCÍAS', 
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1)),
                      ],
                    ),
                    
                    const Spacer(), // Empuja los iconos a la derecha
                    
                    // Icono del carrito
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.shopping_cart_outlined, color: Colors.black, size: 24),
                    ),
                    
                    const SizedBox(width: 8), // Espacio entre iconos
                    
                    // Icono de 3 rayas (menú)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.menu, color: Colors.black, size: 24),
                    ),
                  ],
                ),
              ),

              // Buscador
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar perfumes ...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Categorías horizontales
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _CatText('Caballeros'),
                    _CatText('Damas'),
                    _CatText('Perfumes Arabes'),
                    _CatText('Stella Dustin'),
                    _CatText('Perfumeria Nicho'),
                    _CatText('Mayoreo'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // DISEÑO DE 3 COLUMNAS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // COLUMNA IZQUIERDA
                    Expanded(
                      child: Column(
                        children: [
                          ProductCard(title: 'CABALLEROS', color: const Color(0xFF2E4D3E), height: 150, showPrice: true),
                          const SizedBox(height: 10),
                          ProductCard(title: 'DAMAS', color: const Color(0xFF5D4037), height: 150, showPrice: true),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    
                    // COLUMNA CENTRAL (más grande)
                    Expanded(
                      child: ProductCard(title: 'ARABES', color: Colors.black, height: 310, showPrice: true),
                    ),
                    const SizedBox(width: 10),
                    
                    // COLUMNA DERECHA
                    Expanded(
                      child: Column(
                        children: [
                          ProductCard(title: 'NICHO', color: const Color(0xFF6D2121), height: 150, showPrice: true),
                          const SizedBox(height: 10),
                          ProductCard(title: 'STELLA', color: const Color(0xFF1A3A4A), height: 150, showPrice: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Sección "Recién llegados" - VACÍA
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('', style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Subtítulo - VACÍO
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('', style: TextStyle(fontSize: 14, color: Colors.grey)),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String title;
  final Color color;
  final double height;
  final bool showPrice;

  const ProductCard({
    super.key, 
    required this.title, 
    required this.color, 
    required this.height,
    this.showPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          // Precio "Desde $45" en la esquina superior izquierda
          if (showPrice)
            const Positioned(
              top: 10,
              left: 10,
              child: Text('Desde \$45', 
                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w300)),
            ),
          
          // Título centrado
          Center(
            child: Text(title, 
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          ),
          
          // Botón Comprar en la parte inferior
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                color: Color(0xFFFFE600),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
              ),
              child: const Text('Comprar', 
                textAlign: TextAlign.center, 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
            ),
          ),
        ],
      ),
    );
  }
}

class _CatText extends StatelessWidget {
  final String text;
  const _CatText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15), 
      child: Text(text, 
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
    );
  }
}