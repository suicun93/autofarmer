import 'package:get/get.dart';

import '../../../../../common/const.dart';
import '../../../../../common/my_getx_controller.dart';
import '../../../../../common/preferences.dart';
import '../../../../../common/toast.dart';
import '../../today/controllers/today_controller.dart';
import '../data/device_model.dart';
import '../data/device_provider.dart';

class DeviceController extends MyGetXController<DeviceProvider> {
  final error = false.obs;
  final deviceSum = 0.obs;
  final ready = false.obs;
  final deviceCount = 0.obs;
  var devices = RxList<DeviceList>();
  var response = Response<DeviceResponse>();
  final filterDeviceOffline = false.obs;

  var isSync = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    // Pull to refresh and run from beginning
    ready.value = false;
    error.value = false;
    deviceCount.value = 0;
    deviceSum.value = 0;
    devices = RxList<DeviceList>();
    response = Response<DeviceResponse>();
    await loadDevices();
    ready.value = true;
  }

  @override
  void onClose() {}

  loadDevices() async {
    try {
      Map<String, dynamic> mapName = await Preference.getNameMap();

      if (devices.isEmpty)
        response = await provider.getDevices(page: 1);
      else
        response = await provider.getDevices(page: devices.length ~/ limit + 1);

      // Lỗi mạng
      if (!response.isOk && response.statusCode != 400) {
        toast(content: response.statusText);
        error.value = true;
        return;
      }

      // Lỗi server
      if (response.body.code != 200) {
        toast(content: 'Server error: ' + response.body.message);
        error.value = true;
        return;
      }

      // Success => Add all new users vao list
      error.value = false;

      deviceSum.value = response.body.data.total;
      await Preference.setDeviceSum(deviceSum.value);
      Get.find<TodayController>().soDevice.value = deviceSum.value;
      if (response.body.data.deviceList != null &&
          response.body.data.deviceList.length != 0) {
        for (DeviceList deviceList in response.body.data.deviceList) {
          deviceList.device.deviceName =
              mapName[deviceList.device.imei] ?? deviceList.device.deviceName;
          devices.add(deviceList);
          loadClone(deviceList);
        }
        deviceCount.value = devices.length;
      }
    } catch (e) {
      toast(content: e.toString());
      error.value = true;
    }
  }

  void loadClone(
    DeviceList device, {
    bool hardPush = false,
  }) async {
    if (deviceSum.value > 250 && !hardPush) {
      device.device.loading = false;
      device.device.error = true;
      return;
    }

    device.device.loading = true;
    device.device.error = false;
    device.device.cloneCount = 0;
    devices.refresh();

    try {
      final response = await provider.getDeviceClone(imei: device.imei);
      device.device.loading = false;

      // Looxi majng
      if (!response.isOk) {
        device.device.error = true;
        devices.refresh();
        return;
      }

      // Lỗi server
      if (response.body.code != 200) {
        device.device.error = true;
        devices.refresh();
        return;
      }

      device.device.error = false;
      device.device.cloneCount = response.body.listClone.length;
      device.device.lastOnlineCount(device.lastUpdateTime);
      devices.refresh();
    } catch (_) {
      device.device.loading = false;
      device.device.error = true;
      devices.refresh();
    }
  }

  changeDeviceName(Device device) async {
    isSync.value = true;
    final oldMap = await Preference.getNameMap();
    oldMap[device.imei] = device.deviceName;
    await Preference.setNameMap(oldMap);
    isSync.value = false;
    devices.refresh();
    Get.back();
  }
}
