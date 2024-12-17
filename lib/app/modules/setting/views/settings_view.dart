import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/home/views/home_view.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SettingsPage(),
              ])),
        ),
      ),
    );
  }
}

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 440,
          height: 956,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFF21005D)),
          child: Stack(
            children: [
              const Positioned(
                left: 160,
                top: 30,
                child: SizedBox(
                  width: 81,
                  height: 32,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 81,
                        height: 32,
                        child: Text(
                          'Settings',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'ABeeZee',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 17,
                top: 30,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const HomeView()), // Replace HomePage with the actual home page widget
                    );
                  },
                  child: const SizedBox(
                    width: 39,
                    height: 39,
                    child: Icon(
                      Icons.arrow_back, // Use the back arrow icon
                      size: 30, // Adjust the size of the icon
                      color: Colors.white, // Set the icon color to white
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 150,
                top: 60,
                child: Container(
                  width: 108,
                  height: 116,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEADDFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 50, // Circle radius for the profile image
                    backgroundImage: NetworkImage(
                        'https://as1.ftcdn.net/v2/jpg/03/16/12/52/1000_F_316125289_3GTL3Yd9JVQz3Nw50uAEEkOpX6GvK0LE.jpg'), // Use your image URL here
                    backgroundColor: Colors
                        .transparent, // Optional: set background to transparent if needed
                  ),
                ),
              ),
              const Positioned(
                left: 160,
                top: 185,
                child: SizedBox(
                  width: 90,
                  height: 15,
                  child: Text(
                    'Mrs. Selena',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 153,
                top: 203,
                child: SizedBox(
                  width: 102,
                  height: 15,
                  child: Text(
                    '+64826429264',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 150,
                top: 224,
                child: Container(
                  width: 112,
                  height: 22,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF127EB8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 175,
                top: 228,
                child: Text(
                  'Edit Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: 'ABeeZee',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 23,
                top: 274,
                child: Container(
                  width: 350,
                  height: 143,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1F173C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 442,
                child: Container(
                  width: 350,
                  height: 111,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1F173C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 442,
                child: Container(
                  width: 350,
                  height: 111,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1F173C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 442,
                child: Container(
                  width: 350,
                  height: 111,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1F173C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 23,
                top: 577,
                child: Container(
                  width: 350,
                  height: 42,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1F173C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 49,
                top: 291,
                child: Container(
                  width: 32,
                  height: 30,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF5EC1F6),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 50,
                top: 374,
                child: Container(
                  width: 32,
                  height: 30,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFD4641E),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 49,
                top: 336,
                child: Container(
                  width: 32,
                  height: 30,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF2A759D),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 46,
                top: 457,
                child: Container(
                  width: 32,
                  height: 30,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFFFEE0C),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 46,
                top: 501,
                child: Container(
                  width: 32,
                  height: 30,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF3416DF),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 46,
                top: 501,
                child: Container(
                  width: 32,
                  height: 30,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF3416DF),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 41,
                top: 582,
                child: Container(
                  width: 32,
                  height: 30,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFC41212),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 55,
                top: 296,
                child: Container(
                  width: 21,
                  height: 19,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Icon(
                    Icons.notifications, // Notification icon
                    size: 19, // Adjust size as needed
                    color: Colors.white, // Set the color of the icon
                  ),
                ),
              ),
              Positioned(
                left: 58,
                top: 378,
                child: Container(
                  width: 19,
                  height: 20,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Icon(
                    Icons.lock, // Lock icon for private account
                    size: 20, // Adjust size as needed
                    color: Colors.white, // Set the color of the icon
                  ),
                ),
              ),
              const Positioned(
                left: 105,
                top: 298,
                child: SizedBox(
                  width: 89,
                  height: 15,
                  child: Text(
                    'Notifications',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 105,
                top: 377,
                child: SizedBox(
                  width: 123,
                  height: 15,
                  child: Text(
                    'Privacy & Security',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 97,
                top: 339,
                child: SizedBox(
                  width: 123,
                  height: 15,
                  child: Text(
                    'Private Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 100,
                top: 463,
                child: SizedBox(
                  width: 123,
                  height: 15,
                  child: Text(
                    'Send us a Message',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 100,
                top: 511,
                child: SizedBox(
                  width: 46,
                  height: 15,
                  child: Text(
                    'Share',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 76,
                top: 589,
                child: SizedBox(
                  width: 123,
                  height: 15,
                  child: Text(
                    'Log Out',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 300,
                top: 286,
                child: Container(
                  width: 42,
                  height: 39,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Icon(
                    Icons
                        .toggle_on, // You can use an icon that represents a toggle or switch
                    size: 36, // Adjust size as needed
                    color: Colors.blue, // Set your preferred color for the icon
                  ),
                ),
              ),
              Positioned(
                left: 300,
                top: 323,
                child: Container(
                  width: 42,
                  height: 39,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Icon(
                    Icons
                        .toggle_on, // You can use an icon that represents a toggle or switch
                    size: 36, // Adjust size as needed
                    color: Colors.blue, // Set your preferred color for the icon
                  ),
                ),
              ),
              const Positioned(
                left: 50,
                top: 461,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.message, // Message logo/icon
                    size: 24, // Adjust size as needed
                    color: Colors.white, // Set color to match your design
                  ),
                ),
              ),
              Positioned(
                left: 45,
                top: 500,
                child: Container(
                  width: 28,
                  height: 31,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Icon(
                    Icons.share, // Share logo/icon
                    size: 28, // Adjust size as needed
                    color: Colors.white, // Set color to match your design
                  ),
                ),
              ),
              Positioned(
                left: 42,
                top: 581,
                child: GestureDetector(
                  onTap: () {
                    // Navigasi ke RegisterView
                    Get.toNamed(
                        '/register'); // Pastikan Anda sudah menambahkan route '/register' di GetX routes
                  },
                  child: Container(
                    width: 30,
                    height: 33,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: const Icon(
                      Icons.exit_to_app, // Logout icon
                      size: 30, // Adjust size as needed
                      color: Colors.white, // Set color to match your design
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 300,
                top: 453,
                child: Container(
                  width: 40,
                  height: 36,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Icon(
                    Icons.arrow_forward_ios, // Next arrow icon
                    size: 30, // Adjust size as needed
                    color: Colors.white, // Set color to match your design
                  ),
                ),
              ),
              Positioned(
                left: 300,
                top: 495,
                child: Container(
                  width: 40,
                  height: 36,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Icon(
                    Icons.arrow_forward_ios, // Next arrow icon
                    size: 30, // Adjust size as needed
                    color: Colors.white, // Set color to match your design
                  ),
                ),
              ),
              Positioned(
                left: 300,
                top: 369,
                child: Container(
                  width: 40,
                  height: 36,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Icon(
                    Icons.arrow_forward_ios, // Next arrow icon
                    size: 30, // Adjust size as needed
                    color: Colors.white, // Set color to match your design
                  ),
                ),
              ),
              Positioned(
                left: 55,
                top: 342,
                child: Container(
                  width: 21,
                  height: 19,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: const Icon(
                    Icons.account_circle, // Account icon
                    size: 19, // Adjust size to fit the container
                    color: Colors.white, // Set color to match your design
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
