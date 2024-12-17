import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchExploreController extends GetxController {
  // Observable variable untuk menyimpan hasil pencarian
  RxList<dynamic> searchResults = <dynamic>[].obs;
  RxBool isLoading = false.obs;  // Menambahkan variabel isLoading

  // Method untuk mencari elemen menggunakan PubChem API
  Future<void> searchElements(String query) async {
    // Periksa apakah query kosong atau tidak
    if (query.isEmpty) {
      searchResults.value = [];
      return;
    }

    isLoading.value = true;  // Menandakan bahwa data sedang dimuat

    final url = Uri.parse('https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/$query/JSON');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['PropertyTable'] != null && data['PropertyTable']['Properties'] != null) {
          searchResults.value = data['PropertyTable']['Properties'];
        } else {
          searchResults.value = []; // Clear results jika tidak ada data
        }
      } else {
        searchResults.value = []; // Clear results jika gagal load data
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      searchResults.value = []; // Clear results jika terjadi error
    } finally {
      isLoading.value = false; // Menandakan bahwa data sudah selesai dimuat
    }
  }
}

