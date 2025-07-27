import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/prime_screen/subscription_screen/all_coin_list_view.dart';
import 'package:kahaniadda/screens/prime_screen/subscription_screen/pay_subscription_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CoinScreen extends StatelessWidget {
  const CoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 2.h),
              const Text(
                "Welcome!!",
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, color: primary),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      primary,
                      primary.withOpacity(.8),
                      primary,
                    ], // Add another color for the gradient
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Text(
                          "Total coin",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "10.00",
                          style: TextStyle(
                              color: white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/star.png',
                      height: 60,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Buy Coins",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: primary),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      pushToScreen(context, const AllCoinListView());
                    },
                    child: customText(
                        text: 'View all',
                        textcolor: black,
                        fontsize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(
                    Icons.arrow_right_outlined,
                    color: black,
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(3, (index) {
                  return GestureDetector(
                      onTap: () {
                        pushToScreen(context, const PaySubscriptionScreen());
                      },
                      child: _buildCoinCard("20.00", "40", "334"));
                }),
              ),
              const SizedBox(height: 20),
              const Text(
                "Trends",
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: primary),
              ),
              const SizedBox(height: 10),
              _buildTrendCard("coin", "10.00"),
              const SizedBox(height: 10),
              _buildTrendCard("coin", "20.00"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoinCard(String price, String value, String stars) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primary,
            primary.withOpacity(.8),
            primary,
          ], // Add another color for the gradient
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/star.png'),
          const SizedBox(height: 10),
          Text('coin'),
          Text(
            price,
            style: const TextStyle(color: white),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/coin-pop.png',
                  height: 20,
                ),
                Text(
                  stars,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primary,
            primary.withOpacity(.8),
            primary,
          ], // Add another color for the gradient
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/gold-star.png',
            height: 40,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
