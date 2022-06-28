import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/data/api.dart';
import 'package:restaurant_app/model/restaurant_search.dart';

class SearchRestaurantProvider extends ChangeNotifier {
  final Api api;
  SearchRestaurantProvider({required this.api});

  ResultState<SearchRestaurant> _state = ResultState(
      status: Status.hasData,
      message: null,
      data: SearchRestaurant(
        error: false,
        found: 0,
        restaurants: [],
      ));

  ResultState<SearchRestaurant> get state => _state;

  Future<dynamic> getDetail(String keyword) async {
    try {
      _state = ResultState(status: Status.loading, message: null, data: null);
      notifyListeners();
      final SearchRestaurant restaurantSearch = await api.getSearch(keyword);
      _state = ResultState(
        status: Status.hasData,
        message: null,
        data: restaurantSearch,
      );
      notifyListeners();
      return _state;
    } on TimeoutException {
      _state = ResultState(
          status: Status.error, message: 'Request Time Out!', data: null);
      notifyListeners();
      return _state;
    } on SocketException {
      _state = ResultState(status: Status.error, message: '', data: null);
      notifyListeners();
      return _state;
    } on Error catch (error) {
      _state = ResultState(
          status: Status.error, message: error.toString(), data: null);
      notifyListeners();
      return _state;
    }
  }
}
