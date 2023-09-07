import 'package:flutter/material.dart';
import 'package:flutter_app/models/news_model.dart';

class NewsContainer extends StatelessWidget {
  final NewsModel newsItem;

  NewsContainer({required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('ID: ${newsItem.id}'),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        subtitle: Text(
          'Name: ${newsItem.name}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
