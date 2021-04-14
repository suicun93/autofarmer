import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/const.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: isTablet
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _menuIpad(controller),
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
                  ),
                  Expanded(child: controller.mainView.value),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: controller.mainView.value,
                  ),
                  Divider(height: 1),
                  _menuIphone(controller),
                ],
              ),
        // floatingActionButton: controller.floatingActionButton.value != null
        //     ? Container(
        //         child: RaisedButton(
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        //           elevation: 10,
        //           child: Row(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               Icon(
        //                 controller.floatingActionButton.value.icon,
        //                 color: Colors.white,
        //                 size: 20,
        //               ),
        //               SizedBox(width: 2),
        //               Text(
        //                 controller.floatingActionButton.value.title,
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 13.5,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //               )
        //             ],
        //           ),
        //           color: primaryColor.withAlpha(250),
        //           colorBrightness: Brightness.dark,
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(100)),
        //           onPressed: controller.floatingActionButton.value.action,
        //         ),
        //       )
        //     : null,
        // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Widget _menuIpad(HomeController controller) => Container(
        width: 100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5),
              _iconMenuTablet(
                controller: controller,
                title: 'Today',
                icon: Icons.today,
                mainView: MainView.TODAY,
              ),
              Divider(thickness: 1),
              _iconMenuTablet(
                controller: controller,
                title: 'Đăng xuất',
                icon: Icons.logout,
                logOut: true,
              ),
            ],
          ),
        ),
      );

  Widget _menuIphone(HomeController controller) => Container(
        // height: 90,
        color: primaryColor,
        child: Row(
          children: [
            _iconMenuPhone(
              controller: controller,
              mainView: MainView.TODAY,
            ),
            _iconMenuPhone(
              controller: controller,
              mainView: MainView.DEVICE,
            ),
            _iconMenuPhone(
              controller: controller,
              mainView: MainView.CLONE,
            ),
            _iconMenuPhone(
              controller: controller,
              mainView: MainView.HISTORY,
            ),
            _iconMenuPhone(
              controller: controller,
              mainView: MainView.FARMER,
            ),
          ],
        ),
      );

  _iconMenuTablet({
    @required HomeController controller,
    @required String title,
    @required IconData icon,
    MainView mainView,
    bool logOut = false,
  }) =>
      InkWell(
        onTap: logOut
            ? () => controller.logOut()
            : () => controller.changeMainView(mainView),
        child: Container(
          width: 93,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            color: controller.selectedView.value == mainView
                ? Colors.black26.withOpacity(0.05)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 23,
                color: logOut
                    ? Colors.red
                    : controller.selectedView.value == mainView
                        ? primaryColor
                        : Color(0xff828282),
              ),
              SizedBox(height: 6),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: logOut
                      ? Colors.red
                      : controller.selectedView.value == mainView
                          ? primaryColor
                          : Color(0xff828282),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _iconMenuPhone({
    @required HomeController controller,
    MainView mainView,
  }) {
    bool selected = controller.selectedView.value == mainView;
    return Expanded(
      child: InkWell(
        onTap: () => controller.changeMainView(mainView),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25, top: 8),
          child: Container(
            padding: EdgeInsets.only(top: 8),
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color:
                  selected ? Colors.white.withAlpha(100) : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  mapItems[mainView].icon,
                  size: selected ? 23 : 18,
                  color: selected ? Colors.white : Colors.white.withAlpha(80),
                ),
                SizedBox(height: 8.5),
                Text(
                  mapItems[mainView].title,
                  style: TextStyle(
                    fontSize: 11,
                    color: selected ? Colors.white : Colors.white.withAlpha(80),
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                SizedBox(height: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Map<MainView, MenuItem> mapItems = {
    MainView.TODAY: MenuItem(Icons.attach_money_rounded, 'Today'),
    MainView.DEVICE: MenuItem(Icons.mobile_friendly, 'Thiết bị'),
    MainView.HISTORY: MenuItem(Icons.list_alt_rounded, 'Lịch sử'),
    MainView.CLONE: MenuItem(Icons.supervisor_account_sharp, 'Clone'),
    MainView.FARMER: MenuItem(Icons.settings, 'Cài đặt'),
  };
}

class MenuItem {
  final IconData icon;
  final String title;

  MenuItem(this.icon, this.title);
}
