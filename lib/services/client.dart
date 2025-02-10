import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Client {
  static final Client instance = Client._();
  static Dio? _client;

  Client._();

  Dio get client {
    _client ??= Dio(
      BaseOptions(
        baseUrl: dotenv.env['MOVIES_API_URL'] ?? '',
        queryParameters: {
          'apikey': dotenv.env['MOVIES_API_KEY'] ?? '',
        },
      ),
    );
    return _client!;
  }
}
