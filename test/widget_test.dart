// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_driver_test_sample/main.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  group('GoldenBuilder', () {
    const widget = MyHomePage(
      title: '3333',
    );

    GoldenToolkit.runWithConfiguration(
      () => {
        testGoldens('Counter increments smoke test', (WidgetTester tester) async {
          final builder = DeviceBuilder()
            ..overrideDevicesForAllScenarios(devices: [
              // Device.phone,
              Device.iphone11,
              // Device.tabletPortrait,
              // Device.tabletLandscape,
            ])
            ..addScenario(
              widget: widget,
              name: 'default page',
            )
            ..addScenario(
              widget: widget,
              name: 'increase',
              onCreate: (key) async {
                final button = find.descendant(
                  of: find.byKey(key),
                  matching: find.byKey(const ValueKey("button")),
                );

                // Verify that our counter starts at 0.
                expect(button, findsOneWidget);

                // Tap the '+' icon and trigger a frame.
                await tester.tap(button);
                await tester.pump();

                // Verify that our counter has incremented.
                expect(find.text('1'), findsOneWidget);
              },
            );
          // Build our app and trigger a frame.
          await tester.pumpDeviceBuilder(builder);

          await screenMatchesGolden(tester, 'flutter_demo_page_multiple_scenarios');
        }),
      },
      config: GoldenToolkit.configuration.copyWith(enableRealShadows: true),
    );
  });
}
