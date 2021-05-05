import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/const.dart';
import '../../../../../views/views/loading_view.dart';
import '../controllers/history_controller.dart';
import '../data/history_model.dart';

class HistoryView extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Lịch sử thanh toán'),
          elevation: 0,
        ),
        body: isTablet
            ? !controller.ready.value
                ? Column(
                    children: [
                      SizedBox(height: 100),
                      LoadingWidget(),
                    ],
                  )
                : RefreshIndicator(
                    onRefresh: () async => controller.loadHistory(),
                    child: ListView.builder(
                      itemBuilder: (context, index) => Container(),
                      itemCount: controller
                              .response?.body?.result?.listHistory?.length ??
                          0,
                    ),
                  )
            : Column(
                children: [
                  Container(
                    color: Colors.black12.withAlpha(20),
                    padding: EdgeInsets.only(left: 20, top: 10, right: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                'Ngày',
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Sản lượng',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              flex: 5,
                              child: Text(
                                'Trạng thái',
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            InkWell(
                              onTap: () async => controller.showTongTien(),
                              child: SizedBox(
                                width: 40,
                                child: Text(
                                  'Máy',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Divider(
                          height: 1,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: !controller.ready.value
                        ? Center(child: LoadingWidget(xoay: false))
                        : RefreshIndicator(
                            onRefresh: () async => controller.loadHistory(),
                            child: ListView.builder(
                              itemBuilder: (context, index) => controller
                                          .response
                                          ?.body
                                          ?.result
                                          ?.listHistory ==
                                      null
                                  ? Center(
                                      child: Text(
                                        'Không thể tải lịch sử thanh toán',
                                      ),
                                    )
                                  : controller.response.body.result.listHistory
                                              .length ==
                                          0
                                      ? Center(
                                          child: Text(
                                            'Hiện tại bạn chưa có ngày nào được thanh toán',
                                          ),
                                        )
                                      : _item(controller.response.body.result
                                          .listHistory[index]),
                              itemCount: controller.response?.body?.result
                                      ?.listHistory?.length ??
                                  1,
                            ),
                          ),
                  ),
                  !controller.showTong.value
                      ? Container()
                      : Container(
                          color: Colors.black12.withAlpha(20),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Tổng:',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  numberFormatter.format(controller.sum.value),
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
      ),
    );
  }

  _item(History history) => Padding(
        padding: EdgeInsets.only(left: 20, top: 10, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    history.closedTimeIso ?? 'Unknown',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Text(
                    numberFormatter.format(history.amount),
                    textAlign: TextAlign.end,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          history.statusNumber == 1 ? 'Done' : 'Chưa nhận',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: history.statusNumber == 1
                                ? FontWeight.bold
                                : FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        history.statusNumber == 1
                            ? Icons.check_circle
                            : Icons.history_rounded,
                        color: history.statusNumber == 1
                            ? Colors.green
                            : Colors.red,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 40,
                  child: Text(
                    history.totalDevice.toString(),
                    textAlign: TextAlign.center,
                    // style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.black12,
            ),
          ],
        ),
      );
}
