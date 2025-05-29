import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/sholat_model.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api/admin/';

  static Future<List<SholatModel>> fetchSholat(String kategori) async {
    String endpoint = kategori.toLowerCase() == 'fardhu' ? 'sholat-fardhus' : 'sholat-sunnahs';
    final url = Uri.parse('$baseUrl$endpoint');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List data = jsonData['data']; // asumsi response ada key 'data'

      return data
          .map((item) => SholatModel.fromJson(item))
          .where((item) => item.kategori.toLowerCase() == kategori.toLowerCase()) // filter manual di Flutter
          .toList();
    } else {
      throw Exception('Gagal memuat data dari API');
    }
  }
}
