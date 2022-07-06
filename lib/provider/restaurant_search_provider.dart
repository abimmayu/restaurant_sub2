import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/common/result_state.dart';
import 'package:restaurant_app/data/api/api.dart';
import 'package:restaurant_app/data/model/restaurant_search_response.dart';

class SearchRestaurantProvider extends ChangeNotifier {
  final Api api;
  SearchRestaurantProvider({required this.api}) {
    fetchSearch(query);
  }

  RestaurantSearchResult? _restaurantsSearchResult;
  ResultState? _resultState;
  late String _message = '';
  late String _query = '';

  RestaurantSearchResult? get restaurantSearch => _restaurantsSearchResult;
  ResultState? get resultState => _resultState;
  String get message => _message;
  String get query => _query;

  Future<dynamic> fetchSearch(String query) async {
    try {
      if (query.isNotEmpty) {
        _resultState = ResultState.loading;
        _query = query;
        notifyListeners();

        final response = await api.getSearch(query);
        if (response.restaurants.isEmpty) {
          _resultState = ResultState.noData;
          notifyListeners();
          return _message = 'Tidak ada Data!';
        } else {
          _resultState = ResultState.hasData;
          notifyListeners();
          return _restaurantsSearchResult = response;
        }
      }
    } catch (error) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = "Silahkan Cek Internet Kamu :)";
    }
  }
}
