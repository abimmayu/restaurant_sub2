import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/model/restaurant_detail.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final Api api;

  RestaurantDetailProvider({
    required this.api,
  });

  ResultState<RestaurantDetail> _state = ResultState(
    status: Status.loading,
    message: null,
    data: null,
  );

  ResultState<RestaurantDetail> get state => _state;

  Future<ResultState> getDetail(String id) async {
    try {
      _state = ResultState(status: Status.loading, message: null, data: null);
      notifyListeners();
      final RestaurantDetail restaurantDetail = await api.getDetail(id);
      _state = ResultState(
        status: Status.hasData,
        message: null,
        data: restaurantDetail,
      );
      notifyListeners();
      return _state;
    } on TimeoutException {
      _state = ResultState(
          status: Status.error, message: 'timeoutExceptionMessage', data: null);
      notifyListeners();
      return _state;
    } on SocketException {
      _state = ResultState(
          status: Status.error, message: 'socketExceptionMessage', data: null);
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
