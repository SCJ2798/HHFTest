import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:ftest/model/actors.dart';
import 'package:http/http.dart' as http;

class ActorService {
  static ActorService? _instance;

  static ActorService get instance {
    return _instance ?? ActorService();
  }

  ///
  /// Fetch actor details
  Future<List<Actor>?> getActorDetails() async {
    try {
      final response = await http.get(
        Uri.parse("https://www.breakingbadapi.com/api/characters?limit=12"),
        headers: {HttpHeaders.contentTypeHeader: "appliction/json"},
      );

      ///
      /// Check response is Ok Or Not
      if (response.statusCode != 200) throw Exception(response.statusCode);
      final results = jsonDecode(response.body);

      ///
      /// Payload convert as Actor
      return (results as List)
          .map((payload) => Actor.fromPayload(payload))
          .toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
