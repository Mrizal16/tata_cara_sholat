import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/sholat_model.dart';
import 'detail_page.dart';

class KategoriPage extends StatefulWidget {
  final String title;
  final String kategori;

  const KategoriPage({super.key, required this.title, required this.kategori});

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  late Future<Map<String, List<SholatModel>>> futureGroupedSholat;

  @override
  void initState() {
    super.initState();
    futureGroupedSholat = ApiService.fetchSholat(widget.kategori).then((list) {
      Map<String, List<SholatModel>> grouped = {};

      for (var item in list) {
        if (!grouped.containsKey(item.namaSholat)) {
          grouped[item.namaSholat] = [];
        }
        grouped[item.namaSholat]!.add(item);
      }

      for (var key in grouped.keys) {
        grouped[key]!.sort((a, b) => a.id.compareTo(b.id));
      }

      return grouped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF0FFF4), Color(0xFFDFFDE0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FutureBuilder<Map<String, List<SholatModel>>>(
          future: futureGroupedSholat,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Gagal memuat data: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Tidak ada data tersedia.'));
            }

            final groupedData = snapshot.data!;
            final keys = groupedData.keys.toList();

            return Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: keys.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final namaSholat = keys[index];
                  final listSholat = groupedData[namaSholat]!;

                  return _buildCard(context, namaSholat, listSholat);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String nama, List<SholatModel> listSholat) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailPage(
                sholatList: listSholat,
                title: nama,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.mosque, size: 48, color: Colors.green),
              const SizedBox(height: 12),
              Text(
                nama,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
