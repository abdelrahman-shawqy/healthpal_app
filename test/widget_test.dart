import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:healthpal_app/core/routing/routes.dart';
import 'package:healthpal_app/core/widges/custom_button.dart';
import 'package:healthpal_app/core/widges/pagination_dots.dart';
import 'package:healthpal_app/features/splash_and_onboording/data/models/onboarding_model.dart';
import 'package:healthpal_app/features/splash_and_onboording/presentation/screens/splash_screen.dart';

void main() {
  test('Routes definition test', () {
    expect(Routes.splashScreen, 'splashScreen');
    expect(Routes.onboardingScreen, 'onboardingScreen');
    expect(Routes.homeScreen, 'homeScreen');
    expect(Routes.mainScreen, 'mainScreen');
  });

  test('OnboardingModel contains 3 pages', () {
    expect(OnboardingModel.pages.length, 3);
    expect(OnboardingModel.pages[0].titleKey, 'onboarding_title_1');
    expect(OnboardingModel.pages[1].titleKey, 'onboarding_title_2');
    expect(OnboardingModel.pages[2].titleKey, 'onboarding_title_3');
  });

  testWidgets('PaginationDots renders active and inactive dots', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: PaginationDots(count: 3, currentIndex: 1),
        ),
      ),
    );

    expect(find.byType(PaginationDots), findsOneWidget);
    expect(find.byType(AnimatedContainer), findsNWidgets(3));
  });

  testWidgets('CustomButton renders with custom text and reacts to tap',
      (tester) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton.filled(
            text: 'Test Button',
            onPressed: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);
    await tester.tap(find.text('Test Button'));
    expect(tapped, isTrue);
  });

  testWidgets('SplashScreen layout test on various screen sizes', (tester) async {
    // 1. Standard Phone (Pixel 7 / iPhone 14 Pro: 393 x 852)
    tester.view.physicalSize = const Size(1179, 2556);
    tester.view.devicePixelRatio = 3.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(),
      ),
    );
    await tester.pump();
    expect(tester.takeException(), isNull, reason: 'Must not overflow on standard phone');

    // 2. Small Phone (iPhone SE: 375 x 667)
    tester.view.physicalSize = const Size(750, 1334);
    tester.view.devicePixelRatio = 2.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(),
      ),
    );
    await tester.pump();
    expect(tester.takeException(), isNull, reason: 'Must not overflow on small phone');

    // 3. Tall Phone (Sony Xperia / Galaxy: 412 x 915)
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.625;

    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(),
      ),
    );
    await tester.pump();
    expect(tester.takeException(), isNull, reason: 'Must not overflow on tall phone');

    // Reset view
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
