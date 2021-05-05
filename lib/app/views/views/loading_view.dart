import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final size = Get.size.shortestSide;
  final mini;
  final xoay;

  LoadingWidget({
    this.mini = false,
    this.xoay = true,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ratio = mini ? 0.2 : 0.4;
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: !xoay
            ? Image.asset(
                'images/loading_rowing.gif',
                fit: BoxFit.cover,
                width: size * ratio,
                height: size * ratio,
              )
            : Lottie.asset(
                'images/loading.json',
                fit: BoxFit.cover,
                width: size / 4 * ratio,
                height: size / 4 * ratio,
              ),
      ),
    );
  }
}
