import 'package:flutter/material.dart';
import 'package:minka_design_app/source/services/services.dart';
import 'package:minka_design_app/source/ui/input_decotations.dart';
import 'package:minka_design_app/source/widgets/widgets.dart';
import 'package:provider/provider.dart';

class DocumentScreen extends StatelessWidget {
  static const String routerName = 'document';

  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final documentService = Provider.of<DocumentsService>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                DocumentImage(
                  url: documentService.selectedProduct?.picture,
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
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'Document titie', labelText: 'Title:'),
            ),
            const SizedBox(height: 30),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '2830 EUR', labelText: 'Price:'),
            ),
            const SizedBox(height: 30),
            SwitchListTile.adaptive(
                value: true,
                title: const Text('Available'),
                activeColor: Colors.lightBlue,
                onChanged: (value) {
                  //TODO: Pending to create
                }),
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
