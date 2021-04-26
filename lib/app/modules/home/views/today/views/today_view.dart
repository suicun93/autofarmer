import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/const.dart';
import '../../../../../views/views/loading_view.dart';
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
        body: !controller.ready.value
            ? Column(
                children: [
                  SizedBox(height: 100),
                  LoadingWidget(),
                ],
              )
            : RefreshIndicator(
                onRefresh: () async => controller.loadToday(),
                child: ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 25,
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
                            SizedBox(
                              width: 25,
                              child: Text(
                                'Giá',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
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
                                'Thành tiền',
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
                      _dataRow(
                        title: 'Tổng tiền',
                        number: controller.tongTien.value,
                      ),
                      Divider(height: 2),
                      SizedBox(height: 20)
                    ],
                  ),
                  itemCount: 1,
                ),
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
