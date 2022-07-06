import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/data/model/restaurant_detail_response.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final Api api;
  final String restaurants;

  RestaurantDetailProvider({required this.api, required this.restaurants}) {
    _fetchDetailRestaurants();
  }

  late RestaurantDetailResult _restaurantDetailResult;
  late ResultState _resultState;
  String _message = '';

  RestaurantDetailResult get restaurantDetailResult => _restaurantDetailResult;
  ResultState get resultState => _resultState;
  String get message => _message;

  Future<dynamic> _fetchDetailRestaurants() async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      final response = await api.getDetails(restaurants);
      if (response.restaurants == ResultState.noData) {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _restaurantDetailResult = response;
      }
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = "Tidak Ada Internet!";
    }
  }
}
