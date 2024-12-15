import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  final List<String> _images = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image5.png',
  ];

  CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF243748), Color(0xFF4B749F)], // Warna baru
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FullScreenImage(imagePath: _images[index]),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    shadowColor:
                        Colors.black.withOpacity(0.2), // Shadow lebih lembut
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Hero(
                      tag: _images[index], // Animasi transisi Hero
                      child: Image.asset(
                        _images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background fullscreen
      body: Center(
        child: Hero(
          tag: imagePath,
          child: InteractiveViewer(
            // Membuat gambar dapat di zoom secara interaktif
            child: Image.asset(
              imagePath,
              fit: BoxFit
                  .contain, // Menjaga aspek rasio gambar agar tidak stretch
            ),
          ),
        ),
      ),
    );
  }
}
