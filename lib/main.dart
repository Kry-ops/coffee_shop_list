
import 'package:flutter/material.dart';
import 'pages/kopi_kenangan.dart';
import 'pages/tomoro_coffee.dart';
import 'pages/fore_coffee.dart';
import 'pages/point_coffee.dart';
import 'pages/space_roastery.dart';
import 'pages/excelso.dart';
import 'pages/arah_coffee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daftar Coffee Shop',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(0, 136, 147, 156),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Map<String, String>> wisata = [
    {
      'nama': 'Kopi Kenangan',
      'lokasi': 'Indonesia',
      'gambar':
          'assets/logo/logo_kopi_kenangan.png',
    },
    {
      'nama': 'Tomoro Coffee',
      'lokasi': 'Indonesia',
      'gambar':
          'assets/logo/logo_tomoro_coffee.png',
    },
    {
      'nama': 'Fore Coffee',
      'lokasi': 'Indonesia',
      'gambar':
          'assets/logo/logo_fore.png',
    },
    {
      'nama': 'Point Coffee',
      'lokasi': 'Indonesia',
      'gambar':
          'assets/logo/logo_point_coffee.png',
    },
    {
      'nama': 'Space Roastery',
      'lokasi': 'Yogyakarta',
      'gambar':
          'assets/logo/logo_space_roastery.png',
    },
    {
      'nama': 'Excelso',
      'lokasi': 'Indonesia',
      'gambar':
          'assets/logo/logo_excelso.png',
    },
    {
      'nama': 'Arah Coffee',
      'lokasi': 'Indonesia',
      'gambar':
          'assets/logo/logo_arah_coffee.png',
    },
  ];

  Widget halamanTujuan(Map<String, String> tempat) {
  switch (tempat['nama']) {
    case 'Kopi Kenangan':
      return const KopiKenanganPage();
    case 'Tomoro Coffee':
      return const TomoroCoffeePage();
    case 'Fore Coffee':
      return const ForePage();
    case 'Point Coffee':
      return const PointCoffeePage();
    case 'Space Roastery':
      return const SpaceRoasteryPage();
    case 'Excelso':
      return const ExcelsoPage();
    case 'Arah Coffee':
      return const ArahCoffeePage();
    
    default:
      return const Scaffold(
        body: Center(
          child: Text('Halaman tidak ditemukan'),
        ),
      );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Coffee Shop',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 50, 41, 25),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: wisata.length,
        itemBuilder: (context, index) {
          final tempat = wisata[index];

          return Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => halamanTujuan(tempat),
                  ),
                );
              },
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: tempat['gambar']!.startsWith('assets/')
                        ? Image.asset(
                            tempat['gambar']!,
                            width: 105,
                            height: 100,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.image_not_supported);
                            },
                          )
                        : Image.network(
                            tempat['gambar']!,
                            width: 105,
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 105,
                                height: 100,
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.image_not_supported),
                              );
                            },
                          ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tempat['nama']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            tempat['lokasi']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
