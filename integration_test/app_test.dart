import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
// Replace with your app name
import 'package:reverse_cowgirl/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // Change name of test to something that makes sense for your app
  testWidgets('Test MyApp', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // TODO write your test code here

  });
}

extension FinderX on CommonFinders {
  String? displayNumber(){
    final textWidget = find.byKey(const Key('display')).evaluate().single.widget as Text;
    return textWidget.data;
  }
}
