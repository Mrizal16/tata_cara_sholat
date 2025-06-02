import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/sholat_model.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final List<SholatModel> sholatList;

  const DetailPage({
    Key? key,
    required this.title,
    required this.sholatList,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final AudioPlayer audioPlayer;
  bool isPlaying = false;
  int? playingIndex;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();

    // Event ketika audio selesai diputar
    audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        playingIndex = null;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  String getFullUrl(String path) {
    return 'http://127.0.0.1:8000/storage/$path';
  }

  Future<void> playAudio(String url, int index) async {
    print('Mencoba putar audio: $url');
    try {
      if (isPlaying && playingIndex == index) {
        await audioPlayer.stop();
        setState(() {
          isPlaying = false;
          playingIndex = null;
        });
      } else {
        await audioPlayer.stop();
        setState(() {
          isPlaying = true;
          playingIndex = index;
        });
        await audioPlayer.play(UrlSource(url));
        print('Audio diputar dengan sukses');
      }
    } catch (e) {
      print('Error saat play audio: $e');
    }
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: GoogleFonts.cairo(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.green[800],
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(color: Colors.green[200], thickness: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.cairo(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: widget.sholatList.length,
        itemBuilder: (context, index) {
          final sholat = widget.sholatList[index];
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Nama Bacaan
                  Text(
                    sholat.namaBacaan,
                    style: GoogleFonts.cairo(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Gambar (jika ada)
                  if (sholat.gambar.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.shade100.withOpacity(0.6),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Image.network(
                          getFullUrl(sholat.gambar),
                          height: 180,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Text(
                                'Gambar tidak tersedia',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  if (sholat.gambar.isNotEmpty) const SizedBox(height: 20),

                  // Arab
                  sectionTitle('Arab:'),
                  Text(
                    sholat.arab,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.amiri(
                      fontSize: 24,
                      height: 1.6,
                    ),
                  ),
                  divider(),
                  const SizedBox(height: 12),

                  // Latin
                  sectionTitle('Latin:'),
                  Text(
                    sholat.latin,
                    style: GoogleFonts.cairo(
                      fontSize: 18,
                      height: 1.4,
                    ),
                  ),
                  divider(),
                  const SizedBox(height: 12),

                  // Terjemahan
                  sectionTitle('Terjemahan:'),
                  Text(
                    sholat.terjemahan,
                    style: GoogleFonts.cairo(
                      fontSize: 16,
                      height: 1.3,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Tombol Play Audio (jika ada)
                  if (sholat.audio.isNotEmpty)
                    ElevatedButton.icon(
                      onPressed: () => playAudio(getFullUrl(sholat.audio), index),
                      icon: isPlaying && playingIndex == index
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          : const Icon(Icons.play_arrow),
                      label: Text(
                        isPlaying && playingIndex == index
                            ? 'Sedang Diputar...'
                            : 'Putar Audio',
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        textStyle: GoogleFonts.cairo(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
