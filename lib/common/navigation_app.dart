import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

class NavigationApp {
  static intentWithData(String routeName, Object arguments) {
    navigator.currentState?.pushNamed(routeName, arguments: arguments);
  }

  static back() => navigator.currentState?.pop();
}
