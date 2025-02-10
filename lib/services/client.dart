import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final client = Dio(
  BaseOptions(
    baseUrl: dotenv.env['MOVIES_API_URL'] ?? '',
    queryParameters: {
      'apikey': dotenv.env['MOVIES_API_KEY'] ?? '',
    },
  ),
);
