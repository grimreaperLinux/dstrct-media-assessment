import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/news_model.dart';

Future<List<NewsModel>> fetchNewsItems() async {
  final firestore = FirebaseFirestore.instance;
  final newsCollection = firestore.collection('news');

  final querySnapshot = await newsCollection.get();

  final newsList =
      querySnapshot.docs.map((doc) => NewsModel.fromSnapshot(doc)).toList();

  return newsList;
}
