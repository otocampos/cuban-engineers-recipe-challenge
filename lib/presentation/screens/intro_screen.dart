import 'package:cuban_recipes/constants/screen_routes.dart';
import 'package:cuban_recipes/presentation/screens/home/home_screen.dart';
import 'package:cuban_recipes/utils/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../constants/widgets_keys.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

class IntroScreen extends ConsumerWidget {
  IntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          key: appBarKey,
          title: const Text(
            key: appBarTitleKey,
            AppStrings.appBartTitle,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      Lottie.asset('assets/imgs/anim.json'),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        key: titleIntroKey,
                        AppStrings.txtTitleIntro,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          key:subTitleIntroKey,
                          AppStrings.txtSubTitleInto,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: ElevatedButton(
                      key: btnIntroKey,
                      onPressed: () {
                        Navigator.of(context)
                            .popAndPushNamed(ScreenRoutes.HOME_SCREEN);
                      },
                      child: const Text(
                          key: btnTitleIntroKey, AppStrings.txtBtnIntro)),
                ),
              ],
            ),
          ),
        ));
  }
}
