import 'package:flutter/material.dart';

import '../../../config/constants.dart';
import '../../components/text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _SearchBar(),
        const _FeaturedWidget(),
        Container(
          height: 180,
          color: Colors.yellow,
          // width: double.infinity,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            // padding: EdgeInsets.all(10),
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            crossAxisCount: 2,
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeaturedWidget extends StatelessWidget {
  const _FeaturedWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      color: const Color(0xFFE5E5E5),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          _FeaturedItemWidget(),
          _FeaturedItemWidget(),
          _FeaturedItemWidget(),
        ],
      ),
    );
  }
}

class _FeaturedItemWidget extends StatelessWidget {
  const _FeaturedItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),

            // color: Colors.red,
            // height: 150,
            // width: 300,
            child: const Image(
              image: AssetImage(
                'assets/images/home_1.png',
              ),
            ),
          ),
        ),
        Positioned(
          // top: 30,
          left: 15,
          right: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ready to deliver to your home'.toUpperCase(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const _OutlinedButtonWidget()
            ],
          ),
        ),
      ],
    );
  }
}

class _OutlinedButtonWidget extends StatelessWidget {
  const _OutlinedButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      onPressed: () {},
      child: Text('Start shopping'.toUpperCase()),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      color: kPrimaryColor,
      width: double.infinity,
      child: const TextFieldWidget(title: 'Search Product'),
    );
  }
}
