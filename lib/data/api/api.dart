import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:restaurant_app/data/model/restaurant_search_response.dart';
import 'package:restaurant_app/data/model/restaurant_detail_response.dart';

class Api {
  static const String _throw = 'Failed load data.';
  static const _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const _list = 'list';

  Future<RestaurantResult> getData() async {
    final response = await http.get(Uri.parse(_baseUrl + _list));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(
        json.decode(
          response.body,
        ),
      );
    } else {
      throw Exception(_throw);
    }
  }

  Future<RestaurantSearchResult> getSearch(String query) async {
    final response = await http.get(Uri.parse(_baseUrl + 'search?q=' + query));
    if (response.statusCode == 200) {
      return RestaurantSearchResult.fromJson(json.decode(response.body));
    } else {
      throw Exception(_throw);
    }
  }

  Future<RestaurantDetailResult> getDetails(String id) async {
    final response = await http.get(Uri.parse(_baseUrl + 'detail/' + id));
    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception(_throw);
    }
  }
}
