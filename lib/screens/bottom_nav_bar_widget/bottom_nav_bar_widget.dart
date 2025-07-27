import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/home_screen/home_screen.dart';
import 'package:kahaniadda/screens/librery_screen/library_screen.dart';
import 'package:kahaniadda/screens/headphone_screen/headphone_screen.dart';
import 'package:kahaniadda/screens/update_screen/update_screen.dart';
import 'package:kahaniadda/screens/prime_screen/prime_screen.dart';
import 'package:kahaniadda/screens/writing_screen/first_screen_writing.dart';
import 'package:kahaniadda/screens/writing_screen/writing_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Define a provider to manage the selected index
final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class BottomNavBarWidget extends ConsumerWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use watch to listen for state changes
    final selectedIndex = ref.watch(bottomNavIndexProvider);

    // Create a list of screens corresponding to the bottom navigation items
    final List<Widget> screens = [
      const HomeScreen(),
      const LibraryScreen(),
      const FirstWritingScreen(),
      const UpdateScreen(),
      const PrimeScreen(),
      const HeadphoneScreen(),
    ];

    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: SizedBox(
        height: 66,
        child: BottomAppBar(
          color: primary.withOpacity(.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(screens.length, (index) {
              return GestureDetector(
                onTap: () {
                  ref.read(bottomNavIndexProvider.notifier).state = index;
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      _getIconPath(index),
                      height: 30,
                      // color: _getIconColor(index, selectedIndex),
                    ),
                    SizedBox(height: 4.sp),
                    customText(
                      text: _getLabel(index),
                      textcolor: _getIconColor(index, selectedIndex),
                      fontsize: 12.sp,
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
      body: screens[selectedIndex],
    );
  }

  String _getIconPath(int index) {
    switch (index) {
      case 0:
        return 'assets/icons/home.png';
      case 1:
        return 'assets/icons/book.png';
      case 2:
        return 'assets/icons/writing.png';
      case 3:
        return 'assets/icons/pencil-glyph-icon.png';
      case 4:
        return 'assets/icons/prime-icon.png';
      case 5:
        return 'assets/icons/headphone.png';
      default:
        return '';
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Library';
      case 2:
        return 'Writing';
      case 3:
        return 'Update';
      case 4:
        return 'Prime';
      case 5:
        return 'Headphone';
      default:
        return '';
    }
  }

  Color _getIconColor(int index, int selectedIndex) {
    return index == selectedIndex ? Colors.black : Colors.grey;
  }
}
