import 'package:flutter/material.dart';
import 'kategori_page.dart';
import 'cara_berwudhu_page.dart';
import 'pembatal_sholat_page.dart';
import 'syarat_sah_sholat_page.dart';
import 'hal_hal_dianjurkan_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, dynamic>> kategoriList = const [
    {'title': 'Sholat Wajib', 'icon': Icons.mosque, 'kategori': 'Fardhu'},
    {'title': 'Sholat Sunnah', 'icon': Icons.mosque_outlined, 'kategori': 'Sunnah'},
    {'title': 'Cara Berwudhu', 'icon': Icons.water_drop, 'kategori': 'Wudhu'},
    {'title': 'Pembatal Sholat', 'icon': Icons.cancel_presentation, 'kategori': 'Pembatal'},
    {'title': 'Syarat Sah Sholat', 'icon': Icons.verified, 'kategori': 'Syarat'},
    {'title': 'Hal-Hal Dianjurkan Sebelum Sholat', 'icon': Icons.checklist_rtl, 'kategori': 'Anjuran'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDCF8E9), Color(0xFFE8F5E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(
                  children: const [
                    Icon(Icons.menu_book, color: Colors.green, size: 32),
                    SizedBox(width: 12),
                    Text(
                      "Bacaan Sholat",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    itemCount: kategoriList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      final item = kategoriList[index];
                      return _buildKategoriCard(context, item);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKategoriCard(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        if (item['kategori'] == 'Wudhu') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CaraBerwudhuPage()),
          );
        } else if (item['kategori'] == 'Pembatal') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PembatalSholatPage()),
          );
        } else if (item['kategori'] == 'Syarat') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SyaratSahSholatPage()),
          );
        } else if (item['kategori'] == 'Anjuran') {  // Navigasi untuk menu Anjuran
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const HalHalDianjurkanPage()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => KategoriPage(
                title: item['title'],
                kategori: item['kategori'],
              ),
            ),
          );
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(2, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item['icon'], size: 52, color: Colors.green[700]),
            const SizedBox(height: 14),
            Text(
              item['title'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
