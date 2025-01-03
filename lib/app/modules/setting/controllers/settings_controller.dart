import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class SettingsController extends GetxController {
  // State management using GetX
  final userName = ''.obs;
  final userEmail = ''.obs;
  final userPhone = ''.obs;
  final userAddress = ''.obs;
  // Fungsi untuk mengambil data dari Login/Register
  void setUserData(String name, String email, String phone) {
    userName.value = name;
    userEmail.value = email;
    userPhone.value = phone;
  }

  // Fungsi CRUD
  // Update profile data
  void updateProfile({String? name, String? phone}) {
    if (name != null) userName.value = name;
    if (phone != null) userPhone.value = phone;
    Get.snackbar("Success", "Profile updated successfully!");
  }

  // Delete profile data
  void deleteProfile() {
    userName.value = '';
    userEmail.value = '';
    userPhone.value = '';
    userAddress.value = '';
    Get.snackbar("Success", "Profile deleted!");
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

    Get.snackbar("Success", "Address updated successfully!");
  }
}
