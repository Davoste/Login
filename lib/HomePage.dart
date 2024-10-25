import 'package:flutter/material.dart';
import 'package:project/onboard/onbaording2.dart';
import 'package:project/onboard/onboarding.dart';
import 'package:project/onboard/onboarding1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  final _controller = PageController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(children: [
            SizedBox(
              height: 600,
              child: PageView(
                controller: _controller,
                children: [Onboarding(), Onboarding1(), Onboarding2()],
              ),
            ),

            // bottom: 100,
            Positioned(
              bottom: 100,
              right: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.black,
                    dotColor: Colors.black,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
              ),
            ),
          ]),
          //indicators
        ],
      ),
    );
  }
}
