import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/get_news.dart';
import 'package:flutter_app/models/news_model.dart';
import 'package:flutter_app/widgets/news_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  List<NewsModel> newsList = [];

  Future<void> _refreshNews() async {
    final List<NewsModel> refreshedNews = await fetchNewsItems();

    setState(() {
      newsList = refreshedNews;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _refreshIndicatorKey.currentState?.show();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refreshNews,
        child: FutureBuilder<List<NewsModel>>(
          future: fetchNewsItems(),
          builder:
              (BuildContext context, AsyncSnapshot<List<NewsModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No news items available.'),
              );
            } else {
              final newsList = snapshot.data!;
              return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (BuildContext context, int index) {
                  final newsItem = newsList[index];
                  return NewsContainer(newsItem: newsItem);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
