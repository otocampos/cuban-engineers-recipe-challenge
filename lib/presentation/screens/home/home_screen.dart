import 'package:cuban_recipes/presentation/screens/home/inspirations_screen/inspirations_screen.dart';
import 'package:cuban_recipes/utils/strings_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_custom_bars/super_custom_bars.dart';

import '../../../constants/widgets_keys.dart';
import '../../providers/provider.dart';
import 'latest_screen/latest_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    final bodies = [
      const Center(child: InspirationsScreen()),
      const LatestScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor:Colors.black,
          key: bottomBarKey,
          currentIndex: indexBottomNavbar,
          onTap: (value) {
            ref
                .read(indexBottomNavbarProvider.notifier)
                .update((state) => value);
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
                icon: Icon(Icons.lightbulb),
                label: AppStrings.bottomBarInspirations),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt), label: AppStrings.bottomBarLatest),
          ],
        ),
      body: bodies[indexBottomNavbar],
    );
  }
}
