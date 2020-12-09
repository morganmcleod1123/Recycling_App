
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recycling_app/main.dart';

void main() {
  testWidgets('Select Plastic Material', (WidgetTester tester) async {
    // find the widgets needed
    final dropmenu = find.byKey(ValueKey('dropmenu'));
    final plasticbutton = find.byKey(ValueKey('plasticbutton'));

    // Execute the test
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));
    await tester.tap(dropmenu);
    await tester.tap(plasticbutton);

    // Verify that our counter has incremented.
    expect(find.text('Plastic'), findsOneWidget);
  });

}
