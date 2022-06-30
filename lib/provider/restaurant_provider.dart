import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';

class RestaurantListProvider extends ChangeNotifier {
  final Api api;

  RestaurantListProvider({required this.api}) {
    _fetchAllRestaurants();
  }

  late RestaurantResult _restaurants;
  late ResultState _resultState;
  String _message = '';

  RestaurantResult get restaurant => _restaurants;
  ResultState get resultState => _resultState;
  String get message => _message;

  Future<dynamic> _fetchAllRestaurants() async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      final response = await api.getData();
      if (response.restaurants.isEmpty) {
        _resultState = ResultState.noData;
        notifyListeners();
        return _message = 'Ga Ada Data';
      } else {
        _resultState = ResultState.hasData;
        notifyListeners();
        return _restaurants = response;
      }
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Gagal Memuat Data';
    }
  }
}
