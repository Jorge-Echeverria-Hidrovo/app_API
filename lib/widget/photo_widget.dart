import 'package:dio_app/models/photo.dart';
import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  final PhotoResponse photo;
  const PhotoWidget({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Text(
            photo.author,
            style: const TextStyle(color: Colors.deepOrangeAccent),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.network(
              photo.downloadUrl,
            ),
          ),
        ],
      ),
    );
  }
}
