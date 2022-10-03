import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:minka_design_app/source/services/services.dart';
import 'package:minka_design_app/source/ui/input_decotations.dart';
import 'package:minka_design_app/source/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class DocumentScreen extends StatelessWidget {
  static const String routerName = 'document';

  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final documentService = Provider.of<DocumentsService>(context);
    return ChangeNotifierProvider(
      child: _DocumentScreenBody(documentService: documentService),
      create: (_) => DocumentFormProvider(documentService.selectedDocument),
    );
  }
}

class _DocumentScreenBody extends StatelessWidget {
  const _DocumentScreenBody({
    Key? key,
    required this.documentService,
  }) : super(key: key);

  final DocumentsService documentService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                DocumentImage(
                  url: documentService.selectedDocument?.picture,
                ),
                Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 40,
                          color: Colors.white,
                        ))),
                Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                        onPressed: () {
                          //TODO: Camera or Galery
                        },
                        icon: const Icon(
                          Icons.camera_alt_outlined,
                          size: 40,
                          color: Colors.white,
                        ))),
              ],
            ),

            const _DocumentForm(),
            //More space for scroll
            const SizedBox(height: 100)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save_outlined),
      ),
    );
  }
}

class _DocumentForm extends StatelessWidget {
  const _DocumentForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final documentForm = Provider.of<DocumentFormProvider>(context);

    final document = documentForm.document;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
            child: Column(
          children: [
            const SizedBox(height: 10),
            TextFormField(
              initialValue: document?.name,
              onChanged: (value) => document?.name = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'The title is required';
                }
                return null;
              },
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Document titie', labelText: 'Title:'),
            ),
            const SizedBox(height: 30),
            TextFormField(
              initialValue: '${document?.price}',
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
              ],
              onChanged: (value) {
                if (double.tryParse(value) == null) {
                  document?.price = 0;
                } else {
                  document?.price = double.parse(value);
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '2830', labelText: 'Price:'),
            ),
            const SizedBox(height: 30),
            SwitchListTile.adaptive(
              value: document!.available,
              title: const Text('Available'),
              activeColor: Colors.lightBlue,
              onChanged: documentForm.updateAvaliability,
            ),
            const SizedBox(height: 30),
          ],
        )),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 5),
              blurRadius: 5)
        ],
      );
}
