import 'package:flutter/material.dart';
import 'package:testproject/controllers/demo_controller.dart';

class Provider extends InheritedWidget {
  final _controller = DemoController();
  Provider({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static DemoController of(BuildContext context) {
    final Provider? result = context.dependOnInheritedWidgetOfExactType<Provider>();
    assert(result != null, 'No Provider found in context');
    return result!._controller;
  }

  @override
  bool updateShouldNotify(Provider old) {
    return false;
  }
}
