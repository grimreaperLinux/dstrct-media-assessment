import 'package:cloud_firestore/cloud_firestore.dart';

class NewsModel {
  final String id;
  final String name;

  NewsModel({required this.id, required this.name});

  factory NewsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return NewsModel(
      id: data['id'],
      name: data['name'],
    );
  }
}
