import 'package:flutter_test/flutter_test.dart';
import 'package:enrollment_requirement_validator/main.dart';

void main() {
  testWidgets('Enrollment portal displays correctly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const EnrollmentApp());

    expect(
      find.text('Enrollment Requirement Validator'),
      findsOneWidget,
    );

    expect(find.text('Student Enrollment Portal'), findsOneWidget);
    expect(find.text('Student Information'), findsOneWidget);
    expect(find.text('Enrollment Requirements'), findsOneWidget);
  });
}
