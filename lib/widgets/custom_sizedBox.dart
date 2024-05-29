import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final num value;
  CustomSizedBox({
    super.key,
    this.value = .05,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * value,
    );
  }
}
