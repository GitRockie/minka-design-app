import 'package:flutter/material.dart';

import '../models/models.dart';

class DocumentsService extends ChangeNotifier {
  final String _baseUrl =
      'https://minka-app-40353-default-rtdb.europe-west1.firebasedatabase.app';

  final List<Document> documents = [];

  //TODO: Make Documents Fetch
}
