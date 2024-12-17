import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';  // For permission handling

class SearchExploreController extends GetxController {
  RxList<dynamic> searchResults = <dynamic>[].obs;
  RxBool isLoading = false.obs;
  RxBool isListening = false.obs;  // Track listening state
  late stt.SpeechToText _speech;  // SpeechToText instance

  @override
  void onInit() {
    super.onInit();
    _speech = stt.SpeechToText();
  }

  // Method to request microphone permission
  Future<void> requestMicrophonePermission() async {
    PermissionStatus status = await Permission.microphone.request();
    if (!status.isGranted) {
      print('Microphone permission denied');
    }
  }

  // Method to start listening to the microphone
  Future<void> startListening() async {
    await requestMicrophonePermission(); // Ensure permission is granted
    isListening.value = true;
    bool available = await _speech.initialize();
    if (available) {
      _speech.listen(onResult: (result) {
        // Update the search query based on the speech result
        if (result.hasConfidenceRating && result.confidence > 0.5) {
          searchElements(result.recognizedWords);
        }
      });
    } else {
      isListening.value = false;
      print("Speech recognition not available");
    }
  }

  // Method to stop listening to the microphone
  Future<void> stopListening() async {
    await _speech.stop();
    isListening.value = false;
  }

  // Method to search for elements
  Future<void> searchElements(String query) async {
    if (query.isEmpty) {
      searchResults.value = [];
      return;
    }

    isLoading.value = true;
    final url = Uri.parse('https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/$query/JSON');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['PropertyTable'] != null && data['PropertyTable']['Properties'] != null) {
          searchResults.value = data['PropertyTable']['Properties'];
        } else {
          searchResults.value = [];
        }
      } else {
        searchResults.value = [];
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      searchResults.value = [];
    } finally {
      isLoading.value = false;
    }
  }
}
