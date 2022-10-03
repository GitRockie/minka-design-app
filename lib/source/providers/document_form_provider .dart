import 'package:flutter/material.dart';

import '../models/models.dart';

class DocumentFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Document? document;

  DocumentFormProvider(this.document);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
