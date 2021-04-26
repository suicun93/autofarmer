import 'package:get/get.dart';

import '../../../../../common/my_getx_controller.dart';
import '../../../../../common/preferences.dart';
import '../../../../../common/toast.dart';
import '../../device/controllers/device_controller.dart';
import '../data/today_model.dart';
import '../data/today_provider.dart';

class TodayController extends MyGetXController<TodayProvider> {
  final ready = false.obs;
  final error = false.obs;
  var response = Response<TodayResponse>();

  // Sum
  final tongTien = 0.obs;

  // Số lượng
  final likepage = 0.obs;
  final follow = 0.obs;
  final buffcomment = 0.obs;
  final viplikeService = 0.obs;
  final bufflike = 0.obs;

  // Giá
  final likepagePrice = 0.obs;
  final followPrice = 0.obs;
  final buffcommentPrice = 0.obs;
  final viplikeServicePrice = 0.obs;
  final bufflikePrice = 0.obs;

  // Tính toán
  final tocDoTrungBinh = 0.obs;
  final sanLuongUocChung = 0.obs;
  final soDevice = 0.obs;

  final tienThua = 0.obs;

  reset() {
    tongTien.value = 0;
    likepage.value = 0;
    follow.value = 0;
    buffcomment.value = 0;
    viplikeService.value = 0;
    bufflike.value = 0;
    likepagePrice.value = 0;
    followPrice.value = 0;
    buffcommentPrice.value = 0;
    viplikeServicePrice.value = 0;
    bufflikePrice.value = 0;
    tocDoTrungBinh.value = 0;
    sanLuongUocChung.value = 0;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await loadToday();
    Get.find<DeviceController>();
  }

  @override
  void onClose() {}

  loadToday() async {
    try {
      error.value = false;
      ready.value = false;

      response = await provider.getToday();

      // Lỗi mạng
      if (!response.isOk && response.statusCode != 400) {
        toast(content: response.statusText);
        ready.value = true;
        error.value = true;
        return;
      }

      // Lỗi server
      if (!response.body.result.success || response.body.result.total == 0) {
        toast(content: 'Today can not be loaded');
        ready.value = true;
        error.value = true;
        return;
      }

      // Success => Add all new users vao list
      reset();
      for (Service service in response.body.result.listService) {
        switch (service.type) {
          case Type.BUFFCOMMENT:
            buffcomment.value = buffcomment.value + service.total;
            buffcommentPrice.value = service.price;
            break;
          case Type.BUFFLIKE:
            bufflike.value = bufflike.value + service.total;
            bufflikePrice.value = service.price;
            break;
          case Type.FOLLOW:
            follow.value = follow.value + service.total;
            followPrice.value = service.price;
            break;
          case Type.LIKEPAGE:
            likepage.value = likepage.value + service.total;
            likepagePrice.value = service.price;
            break;
          case Type.VIPLIKE_SERVICE:
            viplikeService.value = viplikeService.value + service.total;
            viplikeServicePrice.value = service.price;
            break;
        }
      }

      // Tính toán
      tienThua.value = await Preference.getTienthua();
      tongTien.value = likepage.value * likepagePrice.value +
          follow.value * followPrice.value +
          buffcomment.value * buffcommentPrice.value +
          viplikeService.value * viplikeServicePrice.value +
          bufflike.value * bufflikePrice.value -
          tienThua.value;

      // Ước chừng sản lượng
      final DateTime now = DateTime.now().toLocal();
      final DateTime startDay =
          DateTime(now.year, now.month, now.day).toLocal();
      final Duration diff = Duration(
          milliseconds:
              now.millisecondsSinceEpoch - startDay.millisecondsSinceEpoch);
      int steps = diff.inMinutes ~/ 30;

      // Tính sản lượng
      tocDoTrungBinh.value = steps == 0 ? 0 : tongTien.value ~/ steps;
      sanLuongUocChung.value = tocDoTrungBinh.value * 48;
      soDevice.value = await Preference.getDeviceSum();

      // Update UI
      ready.value = true;
    } catch (e) {
      error.value = true;
      ready.value = true;
    }
  }

  int get sanLuongUocChung1May =>
      soDevice.value == 0 ? 0 : sanLuongUocChung.value ~/ soDevice.value;

  int get sanLuong1May =>
      soDevice.value == 0 ? 0 : tongTien.value ~/ soDevice.value;
}
