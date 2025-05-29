class SholatModel {
  final int id;
  final String namaSholat;
  final String namaBacaan;
  final String arab;
  final String latin;
  final String terjemahan;
  final String gambar;
  final String audio;
  final String kategori; // tambahkan ini

  SholatModel({
    required this.id,
    required this.namaSholat,
    required this.namaBacaan,
    required this.arab,
    required this.latin,
    required this.terjemahan,
    required this.gambar,
    required this.audio,
    required this.kategori,
  });

  factory SholatModel.fromJson(Map<String, dynamic> json) {
    return SholatModel(
      id: json['id'],
      namaSholat: json['nama_sholat'],
      namaBacaan: json['nama_bacaan'],
      arab: json['arab'],
      latin: json['latin'],
      terjemahan: json['terjemahan'],
      gambar: json['gambar'] ?? '',
      audio: json['audio'] ?? '',
      kategori: json['kategori'], // ambil dari JSON
    );
  }
}
