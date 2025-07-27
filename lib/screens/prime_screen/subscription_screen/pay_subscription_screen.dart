import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kahaniadda/common_components/custom_button.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaySubscriptionScreen extends StatelessWidget {
  const PaySubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
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
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/big-star.png',
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "10.00",
                      style: TextStyle(
                          color: white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
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
                          const Text(
                            '500',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 80),
                decoration: BoxDecoration(
                  color: primary.withOpacity(.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                      child: Text(
                    '₹ 50',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: CustomButton(
                    text: 'Buy Coin',
                    borderRadius: BorderRadius.circular(10),
                    textColor: white,
                    onPressed: () {},
                    fontSize: 13),
              )
            ],
          ),
        ),
      ),
    );
  }
}
