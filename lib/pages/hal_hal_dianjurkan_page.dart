import 'package:flutter/material.dart';

class HalHalDianjurkanPage extends StatelessWidget {
  const HalHalDianjurkanPage({super.key});

  final List<String> anjuranList = const [
    'Memakai pakaian yang bersih dan rapi sebelum sholat untuk menjaga kesucian dan kekhusyukan.',
    'Berwudhu dengan benar agar sholat diterima dan sesuai syariat.',
    'Menghadap kiblat sebagai syarat sahnya sholat.',
    'Menjaga kebersihan tempat sholat agar nyaman dan sesuai tuntunan.',
    'Membaca doa masuk masjid sebagai sunnah dan untuk mendapatkan keberkahan.',
    'Memulai sholat dengan niat yang ikhlas hanya untuk Allah SWT.',
    'Memperbanyak dzikir sebelum sholat sebagai persiapan hati dan pikiran.',
    'Menghindari hal-hal yang dapat membatalkan wudhu agar sholat tetap sah.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hal-Hal Dianjurkan Sebelum Sholat'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 3,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDCF8E9), Color(0xFFE8F5E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Berikut adalah hal-hal yang dianjurkan sebelum melaksanakan sholat:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: anjuranList.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 6,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              anjuranList[index],
                              style: const TextStyle(
                                fontSize: 15.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
