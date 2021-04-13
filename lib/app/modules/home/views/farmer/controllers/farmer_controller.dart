import 'package:get/get.dart';

import '../../../../../common/my_getx_controller.dart';
import '../data/farmer_model.dart';
import '../data/farmer_provider.dart';

class FarmerController extends MyGetXController<FarmerProvider> {
  final ready = false.obs;
  final error = ''.obs;
  var response = Response<FarmerResponse>();
  var farmer = Rx<Farmer>(Farmer());

  @override
  onInit() async {
    super.onInit();
    await loadFarmer();
  }

  loadFarmer() async {
    try {
      error.value = '';
      ready.value = false;
      response = await provider.getFarmer();

      // Lỗi mạng
      if (!response.isOk) {
        error.value = response.statusText;
        ready.value = true;
        return;
      }

      // Lỗi server
      if (response.body == null || response.body.result.total == 0) {
        error.value = 'Get farmer failed.';
        ready.value = true;
        return;
      }

      // toast(content: response.body.toJson().toString());
      if (response.body != null && response.body.result.listFarmer.isNotEmpty) {
        farmer.value = response.body.result.listFarmer[0];
        error.value = '';
        ready.value = true;
      }
    } catch (e) {
      error.value = 'Get farmer failed. $e';
      ready.value = true;
    }
  }
}
