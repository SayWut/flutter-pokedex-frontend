import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final String apiUrl = dotenv.env['API_URI'] ?? '';

  static Future<void> init() async {
    await dotenv.load();
  }
}
