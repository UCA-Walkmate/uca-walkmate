import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiUrl = dotenv.env['API_URL'] ?? 'API URL not found';
  static String apiKey =
      dotenv.env['APY_KEY_GRAPHOPPER']?? 'API KEY not found';
  static String mapBox = dotenv.env['MAP_URL'] ?? 'MAP URL not found';
}
