import 'package:flutter/material.dart';

class CaraBerwudhuPage extends StatelessWidget {
  const CaraBerwudhuPage({super.key});

  final List<Map<String, String?>> langkahWudhu = const [
    {
      'judul': '1. Membaca Basmalah dan Mencuci Kedua Tangan',
      'gambar': '../assets/images/1.jpg',
      'arab': 'بِسْمِ اللّٰهِ الرَّحْمَٰنِ الرَّحِيْمِ',
      'terjemahan': 'bismillahirrahmanirrahim',
      'artinya': '“Dengan menyebut nama Allah yang maha pemurah lagi maha penyayang”',
      'penjelasan':
          'Membaca basmalah sambil mencuci kedua tangan sampai pergelangan tangan hingga bersih.'
    },
    {
      'judul': '2. Berkumur-kumur',
      'gambar': '../assets/images/2.jpg',
      'arab': null,
      'penjelasan': 'Membersihkan tangan terus berkumur-kumur sebanyak tiga kali.'
    },
    {
      'judul': '3. Membersihkan Lubang Hidung',
      'gambar': '../assets/images/3.jpg',
      'arab': null,
      'penjelasan':
          'Membersihkan lubang hidung sebanyak tiga kali dengan menghirup air dan mengeluarkannya.'
    },
    {
      'judul': '4. Membasuh Muka Sambil Membaca Niat',
      'gambar': '../assets/images/4.jpg',
      'arab':
          'نَوَيْتُ الْوُضُوْءَ لِرَفْعِ الْحَدَثِ اْلأَصْغَرِ فَرْضًا لِلّٰهِ تَعَالَى',
      'terjemahan':
          'Nawaitul whudu-a lirofil hadatsii ashghori fardhon lillaahi ta aalaa',
      'artinya':
          'Saya niat berwudhu untuk menghilangkan hadast kecil fardhu karena Allah Ta’ala',
      'penjelasan':
          'Membasuh muka tiga kali mulai dari dahi hingga dagu dan dari telinga ke telinga sambil membaca niat wudhu.'
    },
    {
      'judul': '5. Membasuh Kedua Tangan Sampai Siku',
      'gambar': '../assets/images/5.jpg',
      'arab': null,
      'penjelasan':
          'Membasuh kedua tangan sampai siku sebanyak tiga kali, dimulai dari tangan kanan.'
    },
    {
      'judul': '6. Mengusap Kepala',
      'gambar': '../assets/images/6.jpg',
      'arab': null,
      'penjelasan': 'Menyapu atau mengusap sebagian rambut kepala sebanyak tiga kali.'
    },
    {
      'judul': '7. Membasuh Kedua Telinga',
      'gambar': '../assets/images/7.jpg',
      'arab': null,
      'penjelasan':
          'Membasuh kedua telinga sebanyak tiga kali dengan mendahulukan telinga kanan.'
    },
    {
      'judul': '8. Membasuh Kedua Kaki',
      'gambar': '../assets/images/8.jpg',
      'arab': null,
      'penjelasan':
          'Mencuci kaki sebanyak tiga kali, dimulai dari kaki kanan sampai mata kaki.'
    },
    {
      'judul': '9. Membaca Doa Setelah Wudhu',
      'gambar': '../assets/images/1.jpg',
      'arab': '''اَشْهَدُ اَنْ لَااِلٰهَ اِلَّااللهُ وَحْدَهُ لاَشَرِيْكَ لَهُ 
وَاَشْهَدُ اَنَّ مُحَمَّدًاعَبْدُهُ وَرَسُوْلُهُ.
اَللّٰهُمَّ اجْعَلْنِىْ مِنَ التَّوَّابِيْنَ وَاجْعَلْنِىْ مِنَ الْمُتَطَهِّرِيْنَ، وَجْعَلْنِيْ مِنْ عِبَادِكَ الصَّالِحِيْنَ''',
      'terjemahan':
          'Asyhadu allaa ilaaha illalloohu wahdahuu laa syariika lahu wa asyhadu anna muhammadan abduhuuwa rosuuluhuu, alloohummaj alnii minat tawwaabiina waj’alnii minal mutathohhiriina, waj alnii min ibadikash shaalihiina',
      'artinya':
          '"Aku bersaksi, tidak ada Tuhan selain Allah Yang Maha Esa, tidak ada sekutu bagi-Nya, dan aku mengaku bahwa Nabi Muhammad itu adalah hamba dan Utusan Allah. Ya Allah, jadikanlah aku dari golongan orang-orang yang bertaubat dan jadikanlah aku dari golongan orang-orang yang suci dan jadikanlah aku dari golongan hamba-hamba Mu yang shaleh"',
      'penjelasan':
          'Membaca doa memohon agar Allah menjadikan kita termasuk orang yang bertaubat dan suci.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cara Berwudhu'),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: langkahWudhu.length,
        itemBuilder: (context, index) {
          final langkah = langkahWudhu[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              childrenPadding: const EdgeInsets.all(16),
              title: Text(
                langkah['judul']!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              leading: const Icon(Icons.water_drop_rounded, color: Colors.green),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    langkah['gambar']!,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                if (langkah['arab'] != null) ...[
                  Text(
                    langkah['arab']!,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'Amiri',
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
                if (langkah['terjemahan'] != null) ...[
                  Text(
                    'Latin:\n${langkah['terjemahan']}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                ],
                if (langkah['artinya'] != null) ...[
                  Text(
                    'Artinya:\n${langkah['artinya']}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                ],
                Text(
                  'Penjelasan:\n${langkah['penjelasan']}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
