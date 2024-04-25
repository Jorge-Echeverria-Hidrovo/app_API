import 'package:dio_app/api/photo_api.dart';
import 'package:dio_app/models/photo.dart';
import 'package:dio_app/widget/photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  //Agregar la inyección de dependencias con GetIt
  final PhotoAPI photoAPI = GetIt.instance<PhotoAPI>();

  //Crear la función llamada loadProducts() para la consulta de los datos
   Future<List<PhotoResponse>> loadPhotos() async {
    List<PhotoResponse> photos = await photoAPI.getAllPhotos();
    return photos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foto API"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      backgroundColor: Colors.orangeAccent,
      body: FutureBuilder<List<PhotoResponse>>(
        future: loadPhotos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                List<PhotoResponse>? photoList = snapshot.data;
                return PhotoWidget(photo: photoList![index]);
              });
        },
      ),
    );
  }
}
