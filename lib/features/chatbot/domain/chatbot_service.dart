import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ChatbotService {
  Future<String> sendMessage(String message);
  Future<void> clearHistory();
}

class GeminiChatbotService implements ChatbotService {
  final String apiKey;

  // TODO: Add google_generative_ai instance here
  // final GenerativeModel _model;
  // final ChatSession _chat;

  GeminiChatbotService({required this.apiKey}) {
    // Initialize Gemini here
    // _model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    // _chat = _model.startChat();
  }

  @override
  Future<String> sendMessage(String message) async {
    try {
      // final response = await _chat.sendMessage(Content.text(message));
      // return response.text ?? 'Maaf, saya tidak mengerti.';

      await Future.delayed(const Duration(seconds: 1));
      return 'Ini adalah respons simulasi dari AI. Integrasi Gemini API perlu diimplementasikan.';
    } catch (e) {
      return 'Maaf, terjadi kesalahan: $e';
    }
  }

  @override
  Future<void> clearHistory() async {
    // _chat = _model.startChat();
  }
}

final chatbotServiceProvider = Provider<ChatbotService>((ref) {
  // TODO: Replace with actual API key securely
  return GeminiChatbotService(apiKey: 'YOUR_GEMINI_API_KEY');
});
