import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/widgets/home_screen_test.dart';
import '../test/widgets/inspirations_screen_test.dart';
import '../test/widgets/intro_screen_test.dart';


void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Integratoin', () {
    testWidgets('Intro-Page', (tester) => IntroWidgetTest(tester));
    testWidgets('Home-Page', (tester) => HomeWidgetTest(tester));
    testWidgets('Inspiration-Page', (tester) => InspirationsWidgetTest(tester));

  });
}