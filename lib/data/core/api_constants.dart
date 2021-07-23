import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  ApiConstants._();

  static const String BASE_URL = "https://unogsng.p.rapidapi.com";
  static final String? apiKey = dotenv.env['API_KEY'];
}
