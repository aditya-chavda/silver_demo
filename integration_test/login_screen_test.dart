import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:sliver_demo/screens/login_screen.dart';
import 'package:sliver_demo/widgets/privacy_footer.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Keyboard does not obscure text fields when opened',
      (WidgetTester tester) async {
    // Build the login screen widget
    await tester.pumpWidget(
      MaterialApp(
        // Add your app's theme and other configurations here
        theme: ThemeData(
          useMaterial3: true,
          platform: TargetPlatform.iOS,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              backgroundColor: Colors.deepOrangeAccent,
              foregroundColor: Colors.white,
              minimumSize: const Size(160, 50),
            ),
          ),
        ),
        // Add your login screen widget here
        home: const LoginScreen(),
      ),
    );

    await testAllTextFieldsVisibilityWithKeyboard(tester);

    // Verify that the bottommost widget is still accessible by scrolling
    final bottomMostWidget = find.byType(PrivacyFooter);
    expect(bottomMostWidget, findsOneWidget);

    // Find the scroll view used in login screen
    final scrollView = find.byType(SingleChildScrollView);
    // Scroll to the bottom to ensure the bottommost widget is accessible
    await tester.dragFrom(
      tester.getCenter(scrollView),
      Offset(0, -tester.getBottomRight(scrollView).dy),
    );
    await tester.pumpAndSettle();

    // Verify we can still find the bottommost widget after scrolling
    expect(bottomMostWidget, findsOneWidget);
  });
}

MediaQueryData rootMediaQuery(WidgetTester tester) =>
    MediaQuery.of(tester.element(find.byType(MaterialApp)));

Future<void> testAllTextFieldsVisibilityWithKeyboard(
  WidgetTester tester,
) async {
  // Find all TextField widgets on screen
  final textFieldCount = tester.widgetList(find.byType(TextField)).length;

  print('Found $textFieldCount text fields to test');

  // Test each text field
  for (int i = 0; i < textFieldCount; i++) {
    // Get the i-th text field
    final textField = find.byType(TextField).at(i);
    print('Testing text field #${i + 1}');

    // Get the initial position
    final initialFieldRect = tester.getRect(textField);
    print('Initial position: $initialFieldRect');

    // Scroll if the field is initially outside viewport
    if (initialFieldRect.bottom > rootMediaQuery(tester).size.height) {
      await tester.dragFrom(
        const Offset(0, 300),
        Offset(
          0,
          rootMediaQuery(tester).size.height - initialFieldRect.bottom - 50,
        ),
      );
      await tester.pumpAndSettle();
      print('Scrolled to position: ${tester.getRect(textField)}');
    }

    // Tap on the field to trigger keyboard
    await tester.tap(textField);
    await tester.pumpAndSettle();

    final keyboardHeight = rootMediaQuery(tester).viewInsets.bottom;
    print('keyboardHeight: $keyboardHeight');
    final fieldRectAfterKeyboard = tester.getRect(textField);
    print('After keyboard: $fieldRectAfterKeyboard');

    // Verify field is visible
    expect(
      fieldRectAfterKeyboard.bottom <
          rootMediaQuery(tester).size.height - keyboardHeight,
      isTrue,
      reason: 'Text field #${i + 1} should be visible when keyboard is open',
    );

    // Check if form shifted upward appropriately
    expect(
      fieldRectAfterKeyboard.top <= initialFieldRect.top,
      isTrue,
      reason:
          'Form should remain in place or shift upward for text field #${i + 1}',
    );

    // Dismiss keyboard before testing next field
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pumpAndSettle();
  }
}
