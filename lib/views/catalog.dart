import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Two images per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(16),
        children: [
          Image.asset(
            'assets/images/image1.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/image2.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/image3.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
