import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/home/views/home_view.dart';
import 'package:myapp/app/modules/search/controllers/search_explore_controller.dart';

class SearchExploreView extends GetView<SearchExploreController> {
  const SearchExploreView({super.key});
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
                SearchExplorePage(),
              ])),
        ),
      ),
    );
  }
}

class SearchExplorePage extends StatelessWidget {
  const SearchExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 440,
          height: 956,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF050505), Color(0xFF12009B), Color(0xFF12009C)],
            ),
          ),
          child: Stack(
            children: [
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
                    width: 42,
                    height: 42,
                    child: Icon(
                      Icons.arrow_back, // Use the back arrow icon
                      size: 30, // Adjust the size of the icon
                      color: Colors.white, // Set the icon color to white
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 44,
                top: 92,
                child: Container(
                  width: 351,
                  height: 54,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFB5B5B5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: -7,
                top: 105,
                child: SizedBox(
                  width: 268,
                  height: 29,
                  child: Text(
                    'Search',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w100,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: -16,
                top: 199,
                child: SizedBox(
                  width: 286,
                  height: 36,
                  child: Text(
                    'Find Your Elemen',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 46,
                top: 254,
                child: Container(
                  width: 70,
                  height: 27,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 1),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          'Helium',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5899999737739563),
                            fontSize: 8,
                            fontFamily: 'Inter',
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
                left: 46,
                top: 300,
                child: Container(
                  width: 85,
                  height: 27,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 1),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Flexible(
                        child:
                      Text(
                        'Natrium',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5899999737739563),
                          fontSize: 8,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                       )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 144,
                top: 300,
                child: Container(
                  width: 76,
                  height: 27,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 1),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Flexible(
                        child:
                      Text(
                        'Oksigen',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5899999737739563),
                          fontSize: 8,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                       )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 240,
                top: 300,
                child: Container(
                  width: 64,
                  height: 27,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 1),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Flexible(
                        child:
                      Text(
                        'Carbon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5899999737739563),
                          fontSize: 7,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                       )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 136,
                top: 254,
                child: Container(
                  width: 63,
                  height: 27,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 1),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Flexible(
                        child:
                      Text(
                        'Neon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5899999737739563),
                          fontSize: 8,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                       )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 220,
                top: 254,
                child: Container(
                  width: 73,
                  height: 27,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 19, vertical: 1),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Flexible(
                        child:
                      Text(
                        'Argon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5899999737739563),
                          fontSize: 8,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                       )
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 327,
                top: 99,
                child: SizedBox(
                  width: 40,
                  height: 39.09,
                  child: Icon(
                    Icons.search, // Use the search icon
                    size: 40, // You can adjust the size as needed
                    color: Colors
                        .white, // Set the color to white or another color of your choice
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
