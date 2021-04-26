import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../common/const.dart';
import '../../../../../views/views/loading_view.dart';
import '../../../../../views/views/nothing_found_view.dart';
import '../../../controllers/home_controller.dart';
import '../controllers/farmer_controller.dart';

class FarmerView extends GetView<FarmerController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Thông tin Farmer'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: !controller.ready.value
              ? LoadingWidget()
              : RefreshIndicator(
                  onRefresh: () async => controller.loadFarmer(),
                  child: controller.error.value
                      ? ListView(
                          children: [
                            SizedBox(
                              height: Get.height - Get.statusBarHeight - 200,
                              child: NothingFound('Farmer'),
                            ),
                          ],
                        )
                      : ListView(
                          children: [
                            _item(
                              title: 'Họ tên',
                              content: controller.farmer.value.fullname,
                            ),
                            _item(
                              title: 'Số điện thoại',
                              content: controller.farmer.value.username,
                            ),
                            _item(
                              title: 'Khởi tạo ngày',
                              content: formatDatetime(
                                controller.farmer.value.createdAt,
                              ),
                            ),
                            _item(
                              title: 'Token',
                              content: controller.farmer.value.token,
                            ),
                            _item(
                              title: 'Email',
                              content: controller.farmer.value.email,
                            ),
                            _item(
                              title: 'Facebook',
                              content: controller.farmer.value.fblink,
                            ),
                            _item(
                              title: 'Ngân hàng',
                              content: controller.farmer.value.bankName,
                            ),
                            _item(
                              title: 'Chủ tài khoản',
                              content: controller.farmer.value.accountName,
                            ),
                            _item(
                              title: 'Số tài khoản',
                              content: controller.farmer.value.bankNumber,
                            ),
                            InkWell(
                              onLongPress: () async => copyToClipboard(
                                'https://www.autofarmer.net/sign-up?reference_code=6SM4WK',
                              ),
                              onTap: () async => copyToClipboard(
                                controller.farmer.value.referenceCode +
                                    controller.farmer.value.inviteCode,
                              ),
                              child: _item(
                                title: 'Mã giới thiệu',
                                content: controller.farmer.value.referenceCode,
                              ),
                            ),
                            _item(
                              title: '100 app',
                              checked: controller.farmer.value.user100App,
                            ),
                            _item(
                              title: 'Tham gia kiếm tiền Like Sub',
                              checked: controller.farmer.value.isLikeSub,
                            ),
                            InkWell(
                              onTap: () => Get.find<HomeController>().logOut(),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 15,
                                ),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    'Đăng xuất',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
        ),
      ),
    );
  }

  Widget _item({
    @required String title,
    String content = '',
    bool checked = true,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  child: content.isNotEmpty
                      ? Text(
                          content,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Row(
                          children: [
                            Expanded(child: Container()),
                            Icon(
                              checked
                                  ? Icons.check_circle
                                  : Icons.warning_rounded,
                              color: checked ? Colors.green : Colors.redAccent,
                              size: 20,
                            ),
                          ],
                        ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Divider(height: 1),
          ],
        ),
      );
}
