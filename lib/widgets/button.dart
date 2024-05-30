import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final VoidCallback onPressed;
  final Icon icon;
  final double width;

  const CustomButton({
    super.key,
    this.width = .5,
    this.icon = const Icon(
      Icons.arrow_forward_rounded,
      color: Colors.white,
    ),
    required this.text,
    this.color = Colors.black26,
    this.fontSize = 18,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          // padding: EdgeInsets.symmetric(
          // horizontal: MediaQuery.of(context).size.width * .13,
          // vertical: MediaQuery.of(context).size.height * .01),
          textStyle: TextStyle(fontSize: fontSize),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              width: 20,
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
