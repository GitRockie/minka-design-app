import 'package:flutter/material.dart';

import '../models/models.dart';

class DocumentFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Document? document;

  DocumentFormProvider(this.document);

  updateAvaliability(bool value) {
    document?.available = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(document!.name);
    print(document!.price);
    print(document!.available);
    return formKey.currentState?.validate() ?? false;
  }
}
