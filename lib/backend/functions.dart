import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:technews_flutter/components/searchbar.dart';
import 'package:technews_flutter/utils/key.dart';

Future<List> fetchnews() async {

  final query = CustomSearchBar.searchcontroller.text.isEmpty
      ? 'technology'
      : CustomSearchBar.searchcontroller.text;

  final response = await http.get(
    Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=${ApiKey.value}&q=$query',
    ),
  );

  if(response.statusCode==200)
    {
      Map result = jsonDecode(response.body);
      print('Fetched');
      return result['articles'];
    } else {
    throw Exception('Failed to load news');
  }
}