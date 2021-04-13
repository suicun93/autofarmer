import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../views/clone/controllers/clone_controller.dart';
import '../views/clone/data/clone_provider.dart';
import '../views/device/controllers/device_controller.dart';
import '../views/device/data/device_provider.dart';
import '../views/farmer/controllers/farmer_controller.dart';
import '../views/farmer/data/farmer_provider.dart';
import '../views/history/controllers/history_controller.dart';
import '../views/history/data/history_provider.dart';
import '../views/today/controllers/today_controller.dart';
import '../views/today/data/today_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    // Today View
    Get.lazyPut<TodayController>(
      () => TodayController(),
    );
    Get.lazyPut<TodayProvider>(
      () => TodayProvider(),
    );

    // Farmer View
    Get.lazyPut<FarmerProvider>(
      () => FarmerProvider(),
    );
    Get.lazyPut<FarmerController>(
      () => FarmerController(),
    );

    // History View
    Get.lazyPut<HistoryProvider>(
      () => HistoryProvider(),
    );
    Get.lazyPut<HistoryController>(
      () => HistoryController(),
    );

    // Device View
    Get.lazyPut<DeviceProvider>(
      () => DeviceProvider(),
    );
    Get.lazyPut<DeviceController>(
      () => DeviceController(),
    );

    // Clone View
    Get.lazyPut<CloneProvider>(
      () => CloneProvider(),
    );
    Get.lazyPut<CloneController>(
      () => CloneController(),
    );

    // Chat support view
    // Get.put<ChatSupportController>(ChatSupportController());
  }
}
