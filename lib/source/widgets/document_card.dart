import 'package:flutter/material.dart';
import 'package:minka_design_app/source/models/models.dart';

class DocumentCard extends StatelessWidget {
  final Document document;

  const DocumentCard({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _docCardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(document.picture),
            _DocumentDetails(
              title: document.name,
              subTitle: document.id!,
            ),
            Positioned(top: 0, right: 0, child: _PriceTag(document.price)),
            if (!document.available)
              Positioned(top: 0, left: 0, child: _NotAvailable()),
          ],
        ),
      ),
    );
  }

  BoxDecoration _docCardBorders() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 30, offset: Offset(0, 7)),
      ],
    );
  }
}

class _NotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.yellow[800],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Not Available',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final double price;

  const _PriceTag(this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '$price',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _DocumentDetails extends StatelessWidget {
  final String title;
  final String subTitle;

  const _DocumentDetails({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        width: double.infinity,
        height: 70,
        decoration: _buildBoxDecoration(),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
  }
}

class _BackgroundImage extends StatelessWidget {
  final String? picture;

  const _BackgroundImage(this.picture);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: picture == null
            ? const Image(
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                placeholder: const AssetImage('assets/jar-loading.gif'),
                imageErrorBuilder:
                    (BuildContext context, Object obj, stackTrace) {
                  return const Image(image: AssetImage('assets/no-image.png'));
                },
                image: NetworkImage(picture!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
