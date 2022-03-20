import 'package:flutter/material.dart';

class RichTextButton extends StatelessWidget {
  const RichTextButton({
    required this.primaryTitle,
    required this.secondaryTitle,
    required this.eventHandler,
    Key? key,
  }) : super(key: key);

  final String primaryTitle;
  final String secondaryTitle;
  final Function eventHandler;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      onPressed: () => eventHandler(),
      child: RichText(
        text: TextSpan(
          text: primaryTitle,
          children: [
            TextSpan(
              text: secondaryTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
