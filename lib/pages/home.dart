import 'package:flutter/material.dart';
import 'package:technews_flutter/backend/functions.dart';
import 'package:technews_flutter/components/appbar.dart';
import 'package:technews_flutter/components/newsbox.dart';
import 'package:technews_flutter/components/searchbar.dart' ;
import 'package:technews_flutter/utils/constants.dart';
import 'package:technews_flutter/utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchnews(); // Fetch news once when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(), // You can replace this with your custom AppBar if needed
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder<List>(
                future: news,
                builder: (context, snapshot) {
                  // Show loading spinner
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  // Handle error
                  else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  // Display data
                  else if (snapshot.hasData) {
                    final articles = snapshot.data!;
                    return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final item = articles[index];

                        return NewsBox(
                          url: item['url'],
                          imageurl: item['urlToImage'] ?? Constants.imageUrl,
                          title: item['title'] ?? 'No Title',
                          time: item['publishedAt'] ?? 'Unknown time',
                          description: item['description']?.toString() ?? 'No Description',
                        );
                      },
                    );
                  }

                  // Fallback
                  else {
                    return const Center(
                      child: Text(
                        'No news data found.',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
