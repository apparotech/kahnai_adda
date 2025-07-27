import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kahaniadda/screens/bottom_nav_bar_widget/bottom_nav_bar_widget.dart';
import 'package:kahaniadda/screens/splash_screen/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure bindings are initialized
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kahani Addaa',
          theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            useMaterial3: true,
          ),
          home: const SplashScreen());
    });
  }
}
