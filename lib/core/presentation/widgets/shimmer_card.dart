import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  final double height;
  final double width;
  final double? radius;
  const ShimmerCard(
      {Key? key,
      required this.height,
      this.width = double.infinity,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[600]!,
      child: Card(
        elevation: 0, // Adjust as needed
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
        ),
        child: SizedBox(
          height: height,
          width: width,
        ),
      ),
    );
  }
}
