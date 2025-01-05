import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  // State management using GetX
  final userName = ''.obs;
  final userEmail = ''.obs;
  final userPhone = ''.obs;
  final userAddress = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserData(); // Load data when the controller is initialized
  }

  // Fungsi untuk mengambil data dari Login/Register
  void setUserData(String name, String email, String phone) {
    userName.value = name;
    userEmail.value = email;
    userPhone.value = phone;
    _saveUserData(); // Save data after setting
  }

  // Fungsi CRUD
  // Update profile data
  void updateProfile({String? name, String? phone}) {
    if (name != null) userName.value = name;
    if (phone != null) userPhone.value = phone;
    _saveUserData(); // Save updated data
    Get.snackbar("Success", "Profile updated successfully!");
  }

  // Delete profile data
  void deleteProfile() {
    userName.value = '';
    userEmail.value = '';
    userPhone.value = '';
    userAddress.value = '';
    _saveUserData(); // Save empty data after deletion
    Get.snackbar("Success", "Profile deleted!");
  }

  // Fungsi untuk menyimpan data ke SharedPreferences
  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', userName.value);
    await prefs.setString('userEmail', userEmail.value);
    await prefs.setString('userPhone', userPhone.value);
    await prefs.setString('userAddress', userAddress.value);
  }

  // Fungsi untuk memuat data dari SharedPreferences
  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString('userName') ?? '';
    userEmail.value = prefs.getString('userEmail') ?? '';
    userPhone.value = prefs.getString('userPhone') ?? '';
    userAddress.value = prefs.getString('userAddress') ?? '';
  }

  // Fungsi untuk mendapatkan lokasi saat ini menggunakan Geolocator
  Future<void> updateAddress() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Mengecek apakah layanan lokasi diaktifkan
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Error", "Location services are disabled.");
      return;
    }

    // Memeriksa izin akses lokasi
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("Error", "Location permissions are denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        "Error",
        "Location permissions are permanently denied. We cannot request permissions.",
      );
      return;
    }

    // Mendapatkan posisi saat ini
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userAddress.value =
        "Lat: ${position.latitude}, Lng: ${position.longitude}";

    _saveUserData(); // Save updated address
    Get.snackbar("Success", "Address updated successfully!");
  }
}
