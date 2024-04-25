// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<PhotoResponse> photoResponseFromJson(String str) => List<PhotoResponse>.from(json.decode(str).map((x) => PhotoResponse.fromJson(x)));

String photoResponseToJson(List<PhotoResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoResponse {
    String id;
    String author;
    int width;
    int height;
    String url;
    String downloadUrl;

    PhotoResponse({
        required this.id,
        required this.author,
        required this.width,
        required this.height,
        required this.url,
        required this.downloadUrl,
    });

    factory PhotoResponse.fromJson(Map<String, dynamic> json) => PhotoResponse(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
    };
}
