import 'package:flutter/material.dart';

class SyaratSahSholatPage extends StatelessWidget {
  const SyaratSahSholatPage({super.key});

  final List<String> syaratList = const [
    'Beragama Islam',
    'Sudah baligh dan berakal sehat',
    'Suci dari Hadast',
    'Suci seluruh anggota badan, pakaian, dan tempat',
    'Menutup aurat:\n   - Laki-laki: antara pusar dan lutut\n   - Perempuan: seluruh tubuh kecuali wajah dan telapak tangan',
    'Masuk waktu yang telah ditentukan untuk masing-masing shalat',
    'Menghadap kiblat',
    'Mengetahui perihal yang menjadi rukun shalat dan sunnah',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syarat Sah Sholat'),
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
                'Berikut adalah syarat-syarat sah sholat yang wajib dipenuhi:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: syaratList.length,
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
                              syaratList[index],
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
