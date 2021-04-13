import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/preferences.dart';
import '../../../routes/app_pages.dart';
import '../views/clone/views/clone_view.dart';
import '../views/device/views/device_view.dart';
import '../views/farmer/view/farmer_view.dart';
import '../views/history/views/history_view.dart';
import '../views/today/views/today_view.dart';

class HomeController extends GetxController {
  final username = ''.obs;
  final ready = false.obs;
  final screenName = ''.obs;
  final requestListBut = false.obs;
  final Rx<GetView> mainView = Rx(TodayView());
  final selectedView = MainView.TODAY.obs;
  final Rx<FloatingButton> floatingActionButton = Rx(
    FloatingButton(
      action: () {},
      icon: Icons.add,
      title: '',
    ),
  );

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadAdminInfo();
  }

  @override
  void onClose() {}

  loadAdminInfo() async {
    username.value = await Preference.getUser();
    changeMainView(MainView.TODAY);
    ready.value = true;
  }

  changeMainView(MainView mainViewEnum) async {
    floatingActionButton.value = null;
    selectedView.value = mainViewEnum;
    requestListBut.value = false;

    switch (mainViewEnum) {
      case MainView.TODAY:
        mainView.value = TodayView();
        screenName.value = 'Today';
        break;
      case MainView.HISTORY:
        mainView.value = HistoryView();
        screenName.value = 'Lịch sử thanh toán';
        break;
      case MainView.DEVICE:
        mainView.value = DeviceView();
        screenName.value = 'Devices';
        break;
      case MainView.CLONE:
        mainView.value = CloneView();
        screenName.value = 'Clones';
        break;
      case MainView.FARMER:
        mainView.value = FarmerView();
        screenName.value = 'Farmer';
        break;
    }
  }

  logOut() {
    requestListBut.value = false;
    Preference.clearAll();
    Get.offAllNamed(Routes.INITIAL);
  }
}

enum MainView {
  HISTORY,
  TODAY,
  DEVICE,
  CLONE,
  FARMER,
}

class FloatingButton {
  Function action;
  IconData icon;

  String title;

  FloatingButton({this.action, this.icon, this.title});
}
