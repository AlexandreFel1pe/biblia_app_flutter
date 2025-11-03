import 'dart:convert';

import 'package:biblia/services/models/biblia_service_model.dart';
import 'package:flutter/services.dart';

class BibliaJsonService {
  Future<Biblia> loadBiblia() async {
    final String response = await rootBundle.loadString('assets/biblia.json');
    final data = await json.decode(response);

    return Biblia.fromJson(data);
  }
}