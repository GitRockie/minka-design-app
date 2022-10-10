import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../models/models.dart';
import 'package:http/http.dart' as http;

class DocumentsService extends ChangeNotifier {
  final String _baseUrl =
      'minka-app-40353-default-rtdb.europe-west1.firebasedatabase.app';

  final List<Document> documents = [];

  late Document? selectedDocument;

  File? newPictureFile;

  bool isLoading = true;
  bool isSaving = false;

  DocumentsService() {
    loadDocuments();
  }

  Future<List<Document>> loadDocuments() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'documents.json');
    final resp = await http.get(url);

    final Map<String, dynamic> documentsMap = json.decode(resp.body);

    documentsMap.forEach((key, value) {
      final tempDocument = Document.fromMap(value);
      tempDocument.id = key;
      documents.add(tempDocument);
    });

    isLoading = false;
    notifyListeners();

    return documents;
  }

  Future saveOrCreateProduct(Document document) async {
    isSaving = true;
    notifyListeners();

    if (document.id == null) {
      //Need to create document
      await createDocument(document);
    } else {
      //Need to update document
      await updateDocument(document);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateDocument(Document document) async {
    final url = Uri.https(_baseUrl, 'documents/${document.id}.json');
    final resp = await http.put(url, body: document.toJson());
    final decodedData = resp.body;

    final index = documents.indexWhere((element) => element.id == document.id);
    documents[index] = document;
    //Update Document List
    return document.id!;
  }

  Future<String> createDocument(Document document) async {
    final url = Uri.https(_baseUrl, 'documents.json');
    final resp = await http.post(url, body: document.toJson());
    final decodedData = jsonDecode(resp.body);
    document.id = decodedData['name'];

    documents.add(document);
    return document.id!;
  }

  void updateSelectedDocumentImage(String path) {
    selectedDocument?.picture = path;
    newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }
}
