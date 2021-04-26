import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/const.dart';
import '../../../../../views/views/loading_view.dart';
import '../../../../../views/views/nothing_found_view.dart';
import '../controllers/device_controller.dart';
import '../data/device_model.dart';

class DeviceView extends GetView<DeviceController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Thiết bị'),
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Colors.yellow.withAlpha(90),
              child: Row(
                children: [
                  Text(
                    'Tổng device: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: !controller.ready.value
                        ? SizedBox(
                            child: LoadingWidget(
                              mini: true,
                            ),
                            height: 30,
                          )
                        : controller.error.value
                            ? Text(
                                'Error',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                              )
                            : Text(
                                '${controller.deviceSum ?? 0}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                              ),
                  ),
                  InkWell(
                    onTap: controller.devices
                                    .where((device) => device.isOffline)
                                    .toList()
                                    .length !=
                                0 ||
                            controller.filterDeviceOffline.value
                        ? () async => controller.filterDeviceOffline.value =
                            !controller.filterDeviceOffline.value
                        : null,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: !controller.filterDeviceOffline.value
                            ? Colors.redAccent.withAlpha(100)
                            : Colors.redAccent.withAlpha(255),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Offline: ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            child: !controller.ready.value
                                ? SizedBox(
                                    child: LoadingWidget(
                                      mini: true,
                                    ),
                                    height: 30,
                                  )
                                : controller.error.value
                                    ? Text(
                                        'Error',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        '${controller.devices.where((device) => device.isOffline).toList().length}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey.withAlpha(50),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
              child: Column(
                children: [
                  SizedBox(height: 7),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 35,
                        child: Text(
                          'No',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'AndrID',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 4,
                        child: Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Status',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 75,
                        child: Text(
                          'Clone',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                ],
              ),
            ),
            Divider(height: 1),
            Expanded(
              child: !controller.ready.value
                  ? Center(child: LoadingWidget())
                  : RefreshIndicator(
                      onRefresh: () async => controller.onReady(),
                      child: controller.error.value ||
                              (controller.devices?.isEmpty ?? true)
                          ? ListView(
                              children: [
                                SizedBox(
                                  height:
                                      Get.height - Get.statusBarHeight - 200,
                                  child: NothingFound('Devices'),
                                )
                              ],
                              physics: AlwaysScrollableScrollPhysics(),
                            )
                          : ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (index ==
                                    controller.devices.length - limit) {
                                  if (controller.response.body.result.data
                                          .deviceList.length >=
                                      limit) controller.loadDevices();
                                }
                                final device = controller.devices[index];
                                return isTablet
                                    ? Container()
                                    : controller.filterDeviceOffline.value
                                        ? (device.isOffline)
                                            ? _item(
                                                device: device,
                                                index: index,
                                              )
                                            : Container()
                                        : _item(
                                            device: device,
                                            index: index,
                                          );
                              },
                              itemCount: controller.deviceCount?.value ?? null,
                            ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item({Device device, int index}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 7),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 35,
                  child: Column(
                    children: [
                      SizedBox(height: 1.7),
                      Text(
                        '${index + 1}',
                        style: TextStyle(color: Colors.grey, fontSize: 13),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        device.displayName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        device.model,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onLongPress: () async => showDialog(
                      context: Get.context,
                      builder: (context) => AlertDialog(
                        title: Text('Đổi tên [${device.deviceName}]'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              autofocus: true,
                              onChanged: (value) {
                                device.deviceName = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Device Name',
                                contentPadding:
                                    EdgeInsets.fromLTRB(15, 0, 15, 0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 0.8,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(child: Container()),
                                Obx(
                                  () => InkWell(
                                    onTap: controller.isSync.value
                                        ? null
                                        : () async =>
                                            controller.changeDeviceName(device),
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: controller.isSync.value
                                            ? Colors.green.withAlpha(100)
                                            : Colors.green.withAlpha(255),
                                      ),
                                      child: Text(
                                        'OK',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    child: SizedBox(
                      height: 35,
                      child: Text(
                        device.deviceName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 3,
                  child: device.loading
                      ? SizedBox(
                          child: LoadingWidget(mini: true),
                          height: 36,
                        )
                      : device.error
                          ? Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: device.lastOnlineTooLong
                                    ? Colors.redAccent
                                    : Colors.lightGreen,
                              ),
                              child: Text(
                                device.lastOnlineString,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.5,
                                ),
                              ),
                            ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 35,
                  child: device.loading
                      ? SizedBox(
                          child: LoadingWidget(mini: true),
                          height: 36,
                        )
                      : device.error
                          ? Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3,
                              ),
                              child: Text(
                                device.cloneCount.toString(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: device.cloneCount > 95
                                      ? Colors.blueAccent
                                      : Colors.deepOrangeAccent,
                                  fontWeight: device.cloneCount > 95
                                      ? FontWeight.normal
                                      : FontWeight.bold,
                                ),
                              ),
                            ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 30,
                  child: device.loading
                      ? SizedBox(
                          child: LoadingWidget(mini: true),
                          height: 36,
                        )
                      : InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 3, right: 3, left: 3),
                            child: Icon(
                              Icons.refresh_rounded,
                              color: Colors.green,
                              size: 28,
                            ),
                          ),
                          onTap: () async => controller.loadClone(
                            device,
                            hardPush: true,
                          ),
                        ),
                ),
              ],
            ),
            SizedBox(height: 7),
            Divider(height: 1),
            SizedBox(height: 3),
          ],
        ),
      );
}
