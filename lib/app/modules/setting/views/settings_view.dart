import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart'; // Add geocoding package for reverse geocoding
import 'package:myapp/app/modules/login/views/login_view.dart';
import 'package:myapp/app/modules/setting/controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: controller.userName.value);
    final TextEditingController phoneController =
        TextEditingController(text: controller.userPhone.value);
    final TextEditingController addressController =
        TextEditingController(text: controller.userAddress.value);

    // Function to fetch current address based on location
    Future<void> _updateAddress() async {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      LocationPermission permission = await Geolocator.checkPermission();

      // If location service is not enabled or permission is denied, return
      if (!serviceEnabled || permission == LocationPermission.denied) {
        // Handle location service or permission issues here
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      // Convert position to address using Geocoding
      List<Placemark> placemarks = await GeocodingPlatform.instance!
          .placemarkFromCoordinates(position.latitude, position.longitude);

      // If the placemarks list is not empty, set the address to the text field
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        addressController.text =
            "${place.street}, ${place.locality}, ${place.country}";
      } else {
        // If no address is found, set a fallback message
        addressController.text = "Address not found";
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor:
            const Color(0xFF6A1B9A), // Purple color for the app bar
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical, // Vertical scrolling
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white, // White background for the body
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section with user details
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color:
                      Colors.purple.withOpacity(0.1), // Light purple background
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 50,
                      color: Color(0xFF6A1B9A), // Purple icon color
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Text(
                              controller.userName.value.isNotEmpty
                                  ? controller.userName.value
                                  : "No Name",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6A1B9A), // Purple text
                              ),
                            )),
                        Obx(() => Text(
                              controller.userEmail.value,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // User Input Fields for Updating Data (Vertical Layout)
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: nameController,
                  style: const TextStyle(color: Colors.purple),
                  decoration: const InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.purple), // Purple label
                    prefixIcon: Icon(Icons.person,
                        color: Colors.purple), // Purple prefix icon
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: phoneController,
                  style: const TextStyle(color: Colors.purple),
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Phone",
                    labelStyle: TextStyle(color: Colors.purple), // Purple label
                    prefixIcon: Icon(Icons.phone,
                        color: Colors.purple), // Purple prefix icon
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Address Input
              TextField(
                controller: addressController,
                style: const TextStyle(color: Colors.purple),
                decoration: const InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(color: Colors.purple), // Purple label
                  prefixIcon: Icon(Icons.location_on,
                      color: Colors.purple), // Purple prefix icon
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Buttons Section (Vertical Layout)
              Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      controller.updateProfile(
                        name: nameController.text,
                        phone: phoneController.text,
                      );
                    },
                    icon: const Icon(Icons.save),
                    label: const Text("Save"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.purple, // Purple button background
                      foregroundColor: Colors.white, // White text color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // Evenly space the buttons
                    children: [
                      ElevatedButton.icon(
                        onPressed:
                            _updateAddress, // Call function to update address
                        icon: const Icon(Icons.location_on),
                        label: const Text("Update Address"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.purple, // Purple button background
                          foregroundColor: Colors.white, // White text color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          controller.deleteProfile();
                        },
                        icon: const Icon(Icons.delete),
                        label: const Text("Delete Profile"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor:
                              Colors.white, // Red button for delete
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Logout Button
              Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.offAll(() => const LoginView()); // Navigate to Login
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white, // Red button for logout
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
