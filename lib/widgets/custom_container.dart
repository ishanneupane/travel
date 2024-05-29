import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final double margin;
  final double radius;
  final String? imageName;
  final Widget? child;

  const CustomContainer({
    Key? key,
    this.height = 300,
    this.width = 300,
    this.radius = 30,
    this.child,
    this.margin = 0,
    this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: height,
      width: width,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        image: imageName != null
            ? DecorationImage(
                image: AssetImage(imageName!),
                fit: BoxFit.fill,
              )
            : null,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      child: child,
    );
  }
}
