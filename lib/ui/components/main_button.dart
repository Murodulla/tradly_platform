import 'package:flutter/material.dart';

import '../../config/constants.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    required this.title,
    required this.eventHandler,
    Key? key,
  }) : super(key: key);

  final String title;
  final Function eventHandler;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => eventHandler(),
        style: ButtonStyle(
          // elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
