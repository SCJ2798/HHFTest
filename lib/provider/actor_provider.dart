import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ftest/model/actors.dart';
import 'package:ftest/services/actor_service.dart';

class ActorProvider extends ChangeNotifier {
  Future<List<Actor>?> getDetails() async {
    try {
      final actors = (await ActorService.instance.getActorDetails())!;
      return actors;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
