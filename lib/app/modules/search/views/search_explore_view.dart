import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/home/views/home_view.dart';
import 'package:myapp/app/modules/search/controllers/search_explore_controller.dart';

class SearchExploreView extends GetView<SearchExploreController> {
  const SearchExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchExploreController controller = Get.put(SearchExploreController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
        scaffoldBackgroundColor: const Color(0xFF1F2A3E),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF21005D),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Search Chemical Elements'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAll(() => HomeView());
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onChanged: (query) {
                    controller.searchElements(query);
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Search for a chemical element...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    prefixIcon: const Icon(Icons.search, color: Color(0xFF21005D)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isListening.value ? Icons.mic : Icons.mic_none,
                        color: controller.isListening.value ? Colors.red : Color(0xFF21005D),
                      ),
                      onPressed: () {
                        if (controller.isListening.value) {
                          controller.stopListening();
                        } else {
                          controller.startListening();
                        }
                      },
                    ),
                  ),
                ),
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.searchResults.isEmpty) {
                  return const Center(child: Text("No results found."));
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.searchResults.length,
                    itemBuilder: (context, index) {
                      final element = controller.searchResults[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                          title: Text(
                            element['IUPACName'] ?? 'No Name',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF21005D),
                            ),
                          ),
                          subtitle: Text(
                            'Molecular Weight: ${element['MolecularWeight'] ?? 'N/A'}',
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF21005D),
                          ),
                          onTap: () {
                            // Handle tap event
                          },
                        ),
                      );
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
