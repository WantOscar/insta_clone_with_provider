import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:insta_clone/src/ui/app/app.dart';

void main() {
  Widget createApp() => const MaterialApp(
        home: App(),
      );
  testWidgets(
    "APP UI 바텀네비게이션 테스트",
    (testWidget) async {
      await testWidget.pumpWidget(createApp());

      expect(find.byType(IndexedStack), findsOneWidget);
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.byIcon(Icons.home), findsAtLeast(5));
    },
  );
}
