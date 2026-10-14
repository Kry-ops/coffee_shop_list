
import 'package:flutter/material.dart';

class ArahCoffeePage extends StatelessWidget {
  const ArahCoffeePage({super.key});

  Widget _gambarGaleri(String path) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.brown.shade100,
              child: const Center(
                child: Icon(
                  Icons.broken_image,
                  size: 40,
                  color: Colors.brown,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Stack(
              children: [
                Image.asset(
                  'assets/logo/logo_arah_coffee_2.png',
                  width: double.infinity,
                  height: 260,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 260,
                      color: Colors.brown.shade100,
                      child: const Center(
                        child: Icon(
                          Icons.coffee,
                          size: 70,
                          color: Colors.brown,
                        ),
                      ),
                    );
                  },
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'ARAH COFFEE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.location_city,
                            color: Colors.brown,
                          ),
                          SizedBox(height: 6),
                          Text('Indonesia'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: Colors.brown,
                          ),
                          SizedBox(height: 6),
                          Text('24/7'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.payments,
                            color: Colors.brown,
                          ),
                          SizedBox(height: 6),
                          Text('15K-35K'),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),
                  const Text(
                    'ARAH Coffee merupakan brand kedai kopi indonesia yang menawarkan beragam minuman kopi dan nonkopi. Brand ini mengembangkan konsep gerai praktis untuk kebutuhan sehari-hari, dengan sejumlah titik lokasi penjualan di beberapa lokasi.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.6,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _gambarGaleri(
                          'assets/arah_coffee_assets/arah_coffee_foto_3.jpg',
                        ),
                        _gambarGaleri(
                          'assets/arah_coffee_assets/arah_coffee_foto_2.jpg',
                        ),
                        _gambarGaleri(
                          'assets/arah_coffee_assets/arah_coffee_foto_1.jpg',
                        ),
                      ],
                    ),
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
