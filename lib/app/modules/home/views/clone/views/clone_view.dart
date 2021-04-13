import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/const.dart';
import '../../../../../views/views/loading_view.dart';
import '../../../../../views/views/nothing_found_view.dart';
import '../controllers/clone_controller.dart';
import '../data/clone_model.dart';
import '../data/clone_provider.dart';

class CloneView extends GetView<CloneController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Clone'),
          elevation: 0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 11),
                  Expanded(
                    child: !controller.ready.value
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LoadingWidget(mini: true),
                            ],
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
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${controller.cloneSum.value ?? 0}',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  Text(
                                    '  Clones',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                ],
                              ),
                  ),
                  SizedBox(width: 5),
                  // !(controller.selectedRequestType.value ==
                  //         RequestType.CHECK_POINT)
                  //     ? Container()
                  //     : InkWell(
                  //         onTap: controller.enableCheckpointBtn.value
                  //             ? () async => controller.checkCheckpointAll()
                  //             : null,
                  //         child: Container(
                  //           padding: EdgeInsets.all(8),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             color: Colors.indigoAccent.withAlpha(
                  //                 controller.enableCheckpointBtn.value
                  //                     ? 255
                  //                     : 100),
                  //           ),
                  //           child: Center(
                  //             child: Text(
                  //               'Check',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  // SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    height: 34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: controller.selectedRequestType.value.toColor(),
                    ),
                    child: DropdownButton<RequestType>(
                      value: controller.selectedRequestType.value,
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.white,
                      ),
                      dropdownColor: primaryColor,
                      underline: Container(color: Colors.transparent),
                      onChanged: (value) {
                        controller.selectedRequestType.value = value;
                        controller.onReady();
                      },
                      selectedItemBuilder: (context) => <RequestType>[
                        RequestType.ALL,
                        RequestType.LIVE,
                        RequestType.STORED,
                        RequestType.CHECK_POINT,
                      ].map<DropdownMenuItem<RequestType>>((RequestType value) {
                        return DropdownMenuItem<RequestType>(
                          value: value,
                          child: Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              value.toStr(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      items: <RequestType>[
                        RequestType.ALL,
                        RequestType.LIVE,
                        RequestType.STORED,
                        RequestType.CHECK_POINT,
                      ].map<DropdownMenuItem<RequestType>>((RequestType value) {
                        return DropdownMenuItem<RequestType>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              value.toStr(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: value.toColor(),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 9),
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
                              (controller.clones?.isEmpty ?? true)
                          ? ListView(
                              physics: AlwaysScrollableScrollPhysics(),
                              children: [
                                SizedBox(
                                  height:
                                      Get.height - Get.statusBarHeight - 200,
                                  child: NothingFound(
                                    'Clones',
                                    positive:
                                        controller.selectedRequestType.value ==
                                            RequestType.CHECK_POINT,
                                  ),
                                ),
                              ],
                            )
                          : ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (index == controller.clones.length - limit) {
                                  if (controller.response.body.result.listClone
                                          .length >=
                                      limit) controller.loadClones();
                                }
                                return isTablet
                                    ? Container()
                                    : _item(
                                        clone: controller.clones[index],
                                        index: index,
                                      );
                              },
                              itemCount: controller.cloneCount?.value ?? null,
                            ),
                    ),
            ),
            controller.showCheckpoint && controller.ready.value
                ? Divider(height: 1)
                : Container(),
            controller.showCheckpoint && controller.ready.value
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: controller.resetLiveCloneCount == 0
                                  ? null
                                  : showConfirmDialog(
                                      'Bạn có chắc chắn muốn reset ${controller.resetLiveCloneCount} clone live?',
                                      controller.resetCloneLive,
                                    ),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: controller.resetLiveCloneCount == 0
                                      ? Colors.indigoAccent.withAlpha(100)
                                      : Colors.indigoAccent,
                                ),
                                child: Center(
                                  child: Text(
                                    'Reset Live',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: InkWell(
                              onTap: controller.checkpointCloneCount == 0
                                  ? null
                                  : showConfirmDialog(
                                      'Bạn có chắc chắn muốn xóa ${controller.checkPointCloneCount} clone?',
                                      controller.deleteCheckpoint,
                                    ),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: controller.checkpointCloneCount == 0
                                      ? Colors.redAccent.withAlpha(100)
                                      : Colors.redAccent,
                                ),
                                child: Center(
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _item({Clone clone, int index}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(height: 7),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
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
                  width: 26,
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => toFanPage(clone.uid ?? ''),
                        child: Text(
                          clone.uid,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        clone.imei ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Text(
                        formatDatetime(
                          DateTime.fromMillisecondsSinceEpoch(clone.createdAt),
                        ),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      SizedBox(height: 10),
                      controller.showCheckpoint &&
                              (clone.imei?.isNotEmpty ?? false)
                          ? Text(
                              formatDatetime(
                                DateTime.fromMillisecondsSinceEpoch(
                                    clone.updatedAt),
                              ),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.orange),
                            )
                          : Container(),
                    ],
                  ),
                ),
                // InkWell(
                //   child: Padding(
                //     padding:
                //         const EdgeInsets.only(bottom: 3, right: 3, left: 3),
                //     child: Icon(
                //       Icons.delete_forever_outlined,
                //       color: Colors.red,
                //       size: 28,
                //     ),
                //   ),
                //   onTap: () async => toast(content: 'Chưa làm'),
                // ),
                controller.showCheckpoint ? SizedBox(width: 10) : Container(),
                controller.showCheckpoint
                    ? InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 3, right: 3, left: 3),
                          child: clone.loading
                              ? LoadingWidget(
                                  mini: true,
                                )
                              : Icon(
                                  clone.error
                                      ? Icons.refresh
                                      : Icons.check_box_outlined,
                                  color: clone.error
                                      ? Colors.green
                                      : clone.checkpoint
                                          ? Colors.redAccent
                                          : Colors.indigoAccent,
                                  size: 28,
                                ),
                        ),
                        onTap: clone.loading
                            ? null
                            : !clone.error
                                ? () async =>
                                    controller.changeCheckpointStatus(clone)
                                : () async => controller.checkCheckpoint(clone),
                      )
                    : Container(),
              ],
            ),
            SizedBox(height: 7),
            Divider(height: 1),
            SizedBox(height: 3),
          ],
        ),
      );
}
