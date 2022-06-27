import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:restaurant_app/model/restaurant_list.dart';
import 'package:restaurant_app/model/restaurant_search.dart';
import 'package:restaurant_app/model/restaurant_detail.dart';

class Api {
  static const _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const _endpointList = 'list';

  Future<RestaurantList> getData() async {
    final response = await http.get(Uri.parse(_baseUrl + _endpointList));
    try {
      if (response.statusCode == 200) {
        return RestaurantList.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load the Data.');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<SearchRestaurant> getSearch(String query) async {
    final response = await http
        .get(Uri.parse(_baseUrl + 'search?q=$query'))
        .timeout(const Duration(seconds: 10));
    try {
      if (response.statusCode == 200) {
        return SearchRestaurant.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to get the result.');
      }
    } on Error {
      rethrow;
    }
  }

  Future<RestaurantDetail> getDetail(String id) async {
    final response = await http
        .get(Uri.parse(_baseUrl + 'details/$id'))
        .timeout((const Duration(seconds: 10)));
    try {
      if (response.statusCode == 200) {
        return RestaurantDetail.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load the Detail.');
      }
    } on Error {
      rethrow;
    }
  }
}
