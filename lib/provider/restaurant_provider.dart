import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/data/api.dart';
import 'package:restaurant_app/model/restaurant_list.dart';

class RestaurantProvider extends ChangeNotifier {
  final Api api;
  RestaurantProvider({required this.api}) {
    _fetchAllRestauran();
  }

  ResultState<RestaurantList> _state =
      ResultState(status: Status.loading, message: null, data: null);

  ResultState<RestaurantList> get state => _state;

  Future<dynamic> _fetchAllRestauran() async {
    try {
      _state = ResultState(status: Status.loading, message: null, data: null);
      notifyListeners();
      final RestaurantList restaurantList = await api.getData();
      _state = ResultState(
        status: Status.hasData,
        message: null,
        data: restaurantList,
      );
      notifyListeners();
      return _state;
    } on TimeoutException {
      _state = ResultState(
          status: Status.error, message: 'Periksa Jaringan Anda!', data: null);
      notifyListeners();
      return _state;
    } on SocketException {
      _state = ResultState(
          status: Status.error,
          message:
              'Jaringan Internet tidak terdeteksi, tolong perikas kembali jaringan anda!',
          data: null);
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
