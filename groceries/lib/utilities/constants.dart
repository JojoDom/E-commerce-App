import 'package:flutter_dotenv/flutter_dotenv.dart';


String get BASE_URL {
  final env = dotenv.get("BASE_URL");
  return env;
}

String get API_KEY {
  final env = dotenv.get("API_KEY");
  return env;
}
