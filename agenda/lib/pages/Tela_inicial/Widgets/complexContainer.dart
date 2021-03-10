import 'dart:math';

import 'package:flutter/material.dart';

class ComplexContainer extends StatelessWidget {
  final List<double> data;

  const ComplexContainer({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Expanded(
      child: ClipPath(
        clipper: IgrejaClipper(
          data: data,
          maxValue: data.reduce(max),
          context: context,
          size: size,
        ),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class IgrejaClipper extends CustomClipper<Path> {
  final double maxValue;
  final List<double> data;
  final BuildContext context;
  final Size size;

  IgrejaClipper({this.size, this.context, this.maxValue, this.data});

  @override
  Path getClip(Size size) {
    double sectionWith =
        (MediaQuery.of(context).size.height * .35) / data.length - 1;

    Path path = Path();

    path.moveTo(0, size.height);

    for (int i = 0; i < data.length; i++) {
      path.lineTo(
          i * sectionWith, size.height - size.height * (data[i] / maxValue));
    }

    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
