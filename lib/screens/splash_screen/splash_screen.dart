import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/screens/welcome_screen/welcome_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timer(const Duration(seconds: 2), () {
      pushToScreen(context, const WelcomeScreen());
    });
    return Scaffold(
      body: Center(
        child: Image.asset('assets/app-logo/kahaniadda-logo.png'),
      ),
    );
  }
}
