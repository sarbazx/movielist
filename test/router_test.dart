// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movielist/movie/view/detail_page.dart';
import 'package:movielist/movies/view/view.dart';

import 'package:movielist/router.dart';

void main() {
  testWidgets('is home page', (WidgetTester tester) async {
    await tester.pumpRealRouterApp(
      HomePage.pagePath,
      (child) => child,
    );

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(BackButton), findsNothing);
  });
  testWidgets('redirected to detail page', (WidgetTester tester) async {
    await tester.pumpRealRouterApp(
      HomePage.pagePath,
      (child) => child,
    );

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byType(DetailPage), findsOneWidget);
  });
}

extension PumpApp on WidgetTester {
  Future<void> pumpRealRouterApp(
    String location,
    Widget Function(Widget child) builder, {
    bool isConnected = true,
  }) {
    return pumpWidget(
      builder(
        MaterialApp.router(
          routerConfig: router,
        ),
      ),
    );
  }
}
