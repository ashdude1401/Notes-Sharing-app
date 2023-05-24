import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class Note extends GetxController {
   String id;
  String title;
  final String author;
  final DateTime uploadTime;
  final String college;
  final String stream;
  final List<String> tags;
  Rx<int> downloads;
  Rx<int> views;
  Rx<bool> isApproved;
  String downloadLink;
  String thumbnailLink;
  final String sellerId;
  Rx<double> price;

  Note( {
     this.id="",
    required this.title,
    required this.author,
    required this.uploadTime,
    required this.college,
    required this.stream,
    required this.tags,
    required int downloads,
    required int views,
    required bool isApproved,
    required this.downloadLink,
    required this.thumbnailLink,
    required this.sellerId,
    required double price,
  })  : downloads = downloads.obs,
        views = views.obs,
        isApproved = isApproved.obs,
        price = price.obs;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'uploadTime': uploadTime.toIso8601String(),
      'college': college,
      'stream': stream,
      'tags': tags,
      'downloads': downloads.value,
      'views': views.value,
      'isApproved': isApproved.value,
      'downloadLink': downloadLink,
      'thumbnailLink': thumbnailLink,
      'sellerId': sellerId,
      'price': price.value,
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      uploadTime: DateTime.parse(json['uploadTime']),
      college: json['college'],
      stream: json['stream'],
      tags: List<String>.from(json['tags']),
      downloads: json['downloads'],
      views: json['views'],
      isApproved: json['isApproved'],
      downloadLink: json['downloadLink'],
      thumbnailLink: json['thumbnailLink'],
      sellerId: json['sellerId'],
      price: json['price'],
    );
  }

  void incrementDownloads() {
    downloads.value++;
  }

  void incrementViews() {
    views.value++;
  }

  bool hasTag(String tag) {
    return tags.contains(tag);
  }

  bool isFree() {
    return price.value == 0.0;
  }
}
