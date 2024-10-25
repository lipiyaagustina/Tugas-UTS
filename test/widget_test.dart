import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:uts/main.dart';

void main() {
  testWidgets('Login page displays correctly and handles login', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: MyApp(
        )
      ),
    );

    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));

    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).last, 'password');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Profil Pengguna'), findsOneWidget);

  });
}
