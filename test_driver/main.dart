import 'package:flutter/material.dart';
import 'package:flutter_driver_test_sample/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  app.main();
}
