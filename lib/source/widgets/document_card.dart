import 'package:flutter/material.dart';

class DocumentCard extends StatelessWidget {
  const DocumentCard({super.key});

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
          children: const [_BackgroundImage(), _DocumentDetails()],
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

class _DocumentDetails extends StatelessWidget {
  const _DocumentDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: 70, color: Colors.indigo);
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: const SizedBox(
        width: double.infinity,
        height: 400,
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
