import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/const.dart';
import '../../../../../common/preferences.dart';
import '../../../../../views/views/loading_view.dart';
import '../../../../../views/views/nothing_found_view.dart';
import '../controllers/today_controller.dart';

class TodayView extends GetView<TodayController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Doanh thu hôm nay'),
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              color: Colors.black12.withAlpha(20),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 15,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Loại',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Giá',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 0),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Số lượng',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Tổng',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: !controller.ready.value
                  ? Center(child: LoadingWidget(xoay: false))
                  : RefreshIndicator(
                      onRefresh: () async => controller.loadToday(),
                      child: controller.error.value
                          ? ListView(
                              children: [
                                SizedBox(
                                  height:
                                      Get.height - Get.statusBarHeight - 200,
                                  child: NothingFound('Today'),
                                )
                              ],
                              physics: AlwaysScrollableScrollPhysics(),
                            )
                          : ListView(
                              children: [
                                Divider(height: 2),
                                _dataRow(
                                  title: 'Số lượt mua Buffcomment',
                                  number: controller.buffcomment.value,
                                  price: controller.buffcommentPrice.value,
                                ),
                                Divider(height: 2),
                                _dataRow(
                                  title: 'Số lượt mua Sub / Follow',
                                  number: controller.follow.value,
                                  price: controller.followPrice.value,
                                ),
                                Divider(height: 2),
                                _dataRow(
                                  title: 'Số lượt mua Likepage',
                                  number: controller.likepage.value,
                                  price: controller.likepagePrice.value,
                                ),
                                Divider(height: 2),
                                _dataRow(
                                  title: 'Số lượt mua ViplikeService',
                                  number: controller.viplikeService.value,
                                  price: controller.viplikeServicePrice.value,
                                ),
                                Divider(height: 2),
                                _dataRow(
                                  title: 'Số lượt mua Bufflike',
                                  number: controller.bufflike.value,
                                  price: controller.bufflikePrice.value,
                                ),
                                Divider(height: 2),
                                InkWell(
                                  onLongPress: () async => Get.dialog(
                                    CupertinoAlertDialog(
                                      title: Text('Sửa lỗi reset Today'),
                                      content: CupertinoTextField(
                                        placeholder: controller.tienThua.value
                                            .toString(),
                                        onChanged: (money) => controller
                                            .tienThua.value = int.parse(
                                          money,
                                          onError: (money) => 0,
                                        ),
                                      ),
                                      actions: [
                                        CupertinoButton(
                                            child: Text('OK'),
                                            onPressed: () async {
                                              await Preference.setTienthua(
                                                controller.tienThua.value,
                                              );
                                              Get.back();
                                            }),
                                        CupertinoButton(
                                          child: Text('Cancel'),
                                          onPressed: () async => Get.back(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: _dataRow(
                                    title: 'Tổng tiền',
                                    number: controller.tongTien.value,
                                  ),
                                ),
                                Divider(
                                  height: 0,
                                  thickness: 3,
                                  color: primaryColor,
                                ),
                                Container(
                                  color: Colors.black12,
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      'Ước tính',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  thickness: 1,
                                  // color: Colors.redAccent,
                                ),
                                _estimateRow(
                                  title: 'Tốc độ trung bình(VND/30 phút): ',
                                  number: controller.tocDoTrungBinh.value,
                                ),
                                Divider(height: 2),
                                _estimateRow(
                                  title: 'Ước tính sản lượng ngày(VND): ',
                                  number: controller.sanLuongUocChung.value,
                                ),
                                Divider(height: 2),
                                _estimateRow(
                                  title: 'Sản lượng mỗi máy(VND): ',
                                  number: controller.sanLuong1May,
                                ),
                                Divider(height: 2),
                                _estimateRow(
                                  title: 'Ước tính sản lượng máy(VND/ngày): ',
                                  number: controller.sanLuongUocChung1May,
                                ),
                                Divider(height: 2),
                              ],
                            ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dataRow({String title, int number = 0, int price = -1}) {
    final isSum = price == -1;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: isSum ? 17 : 13,
                fontWeight: isSum ? FontWeight.bold : FontWeight.normal,
                color: isSum ? Colors.black : Colors.black54,
              ),
            ),
          ),
          SizedBox(width: 5),
          SizedBox(
            width: 25,
            child: Text(
              !isSum ? price.toString() : '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 0),
          !isSum
              ? Expanded(
                  flex: 2,
                  child: Text(
                    numberFormatter.format(number ?? 0),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13),
                    textAlign: TextAlign.end,
                  ),
                )
              : Container(),
          !isSum ? SizedBox(width: 10) : Container(),
          Expanded(
            flex: !isSum ? 2 : 4,
            child: Text(
              '${numberFormatter.format(!isSum ? price * number : number)} ${!isSum ? '' : ' VND'}',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: isSum ? 17 : 13,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _estimateRow({
    @required String title,
    @required int number,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: Row(
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black45,
              ),
            ),
            Text(
              numberFormatter.format(number ?? 0),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
}
