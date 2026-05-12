import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static Future<dynamic> pushReplacementNamed(
    String routeName, {
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  static void pop([Object? result]) {
    return navigatorKey.currentState!.pop(result);
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    RoutePredicate? predicate,
    Object? arguments,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      predicate ?? (route) => false,
      arguments: arguments,
    );
  }

  static void popUntil(RoutePredicate predicate) {
    navigatorKey.currentState!.popUntil(predicate);
  }

  static bool canPop() {
    return navigatorKey.currentState!.canPop();
  }

  static Future<bool> maybePop<T extends Object?>([T? result]) {
    return navigatorKey.currentState!.maybePop(result);
  }
}
