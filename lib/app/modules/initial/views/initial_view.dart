import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/const.dart';
import '../../../views/views/loading_view.dart';
import '../controllers/initial_controller.dart';

class InitialView extends GetView<InitialController> {
  final size =
      Get.size.width < Get.size.height ? Get.size.width : Get.size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: Column(
          children: [
            Expanded(child: Container()),
            Obx(
              () => controller.ready.value
                  ? LoadingWidget(xoay: false)
                  : Container(),
            ),
            SizedBox(height: 100),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
