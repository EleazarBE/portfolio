// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/app.dart';
void main() {
  testWidgets('Portfolio homepage displays its main headings',
      (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('BARACHELLE.'), findsOneWidget);
    expect(find.text('Building things\nthat make sense.'), findsOneWidget);
    expect(find.text('SOFTWARE ENGINEER IN PROGRESS'), findsOneWidget);
  });
}
