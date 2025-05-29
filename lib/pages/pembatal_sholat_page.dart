import 'package:flutter/material.dart';

class PembatalSholatPage extends StatelessWidget {
  const PembatalSholatPage({super.key});

  final List<String> pembatalList = const [
    'Berhadast',
    'Terkena najis yang tidak dimaafkan',
    'Berkata-kata dengan sengaja walaupun dengan satu huruf yang memberikan pengertian',
    'Terbuka auratnya',
    'Mengubah niat, misalnya ingin memutuskan shalat',
    'Makan atau minum meskipun sedikit',
    'Bergerak berturut-turut tiga kali seperti melangkah atau berjalan sekali yang bersangatan',
    'Membelakangi kiblat',
    'Menambah rukun yang berupa perbuatan, seperti rukuk dan sujud',
    'Tertawa terbahak-bahak',
    'Mendahului imamnya dua rukun',
    'Murtad, artinya keluar dari Islam',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembatal Sholat'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 3,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F5E9), Color(0xFFF1F8E9)],
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
                'Berikut adalah hal-hal yang membatalkan sholat:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemCount: pembatalList.length,
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
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              pembatalList[index],
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
