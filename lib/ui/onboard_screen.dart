import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../config/constants.dart';
import '../providers/onboard.dart';
import '../config/size_config.dart';

class Onboard extends StatelessWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final PageController _controller = PageController();

    var state = context.read<OnboardProvider>();

    const _pages = [
      _OnboardingCardWidget(
        title: 'Empowering Artisans, Farmers and Micro Business',
        image: 'assets/images/onboard_1.png',
      ),
      _OnboardingCardWidget(
        title: 'Empowering Artisans, Farmers and Micro Business',
        image: 'assets/images/onboard_2.png',
      ),
      _OnboardingCardWidget(
        title: 'Empowering Artisans, Farmers and Micro Business',
        image: 'assets/images/onboard_3.png',
      ),
    ];

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        color: kPrimaryColor,
        child: PageView(
          controller: _controller,
          children: _pages,
          onPageChanged: (index) {
            if (index == _pages.length - 1) {
              state.toLastPage(true);
            } else {
              state.toLastPage(false);
            }
          },
        ),
      ),
      bottomSheet: _BottomSheetWidget(controller: _controller, pages: _pages),
    );
  }
}

class _BottomSheetWidget extends StatelessWidget {
  const _BottomSheetWidget({
    Key? key,
    required PageController controller,
    required List<_OnboardingCardWidget> pages,
  })  : _controller = controller,
        _pages = pages,
        super(key: key);

  final PageController _controller;
  final List<_OnboardingCardWidget> _pages;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 105,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: _PageIndicatorWidget(controller: _controller, pages: _pages),
          ),
          _ButtonWidget(controller: _controller),
        ],
      ),
    );
  }
}

class _OnboardingCardWidget extends StatelessWidget {
  const _OnboardingCardWidget({
    required this.title,
    required this.image,
    Key? key,
  }) : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.white,
            height: SizeConfig.screenHeight * .5,
            width: SizeConfig.screenWidth,
          ),
        ),
        Positioned(
          left: 15,
          right: 15,
          child: Column(
            children: [
              Card(
                shadowColor: Colors.transparent,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: Image(image: AssetImage(image)),
                ),
              ),
              Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  color: kPrimaryColor,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PageIndicatorWidget extends StatelessWidget {
  const _PageIndicatorWidget({
    required PageController controller,
    required List<_OnboardingCardWidget> pages,
    Key? key,
  })  : _controller = controller,
        _pages = pages,
        super(key: key);

  final PageController _controller;
  final List<_OnboardingCardWidget> _pages;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: _controller,
      count: _pages.length,
      effect: const WormEffect(
        dotColor: kSecondaryColor,
        activeDotColor: kPrimaryColor,
      ),
      onDotClicked: (index) => _controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({
    required PageController controller,
    Key? key,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    var state = context.read<OnboardProvider>();

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: () {
        if (state.lastPage) {
          state.saveOnboardingState();
          Navigator.of(context).popAndPushNamed('/login');
        }
        _controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          context.watch<OnboardProvider>().lastPage ? 'Finish' : 'Next',
        ),
      ),
    );
  }
}
