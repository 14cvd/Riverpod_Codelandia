import 'package:button_animations/button_animations.dart';
import 'package:button_animations/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_codelandia/constant/constRouteString.dart';
import 'package:riverpod_codelandia/widget/appbarWidget.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: AnimatedButton(
          type: PredefinedThemes.light,
          onTap: () {
            context.go(ConstStringRoute.userList);
          },
          child: const Text("Next Page"),
        ),
      ),
    );
  }
}
