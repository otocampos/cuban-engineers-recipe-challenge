import 'package:cuban_recipes/utils/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

class IntroScreen extends ConsumerWidget {
  IntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cooksy",
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  children: [
                    Image(image: AssetImage('assets/imgs/meditating.png')),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      AppStrings.txtTitleIntro,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
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
                    onPressed: () {},
                    child: const Text(AppStrings.txtBtnIntro)),
              ),
            ],
          ),
        ));
  }
}
