import 'package:get/get.dart';

import '../../../../../common/my_getx_controller.dart';
import '../../../../../common/toast.dart';
import '../data/farmer_model.dart';
import '../data/farmer_provider.dart';

class FarmerController extends MyGetXController<FarmerProvider> {
  final ready = false.obs;
  final error = false.obs;
  var response = Response<FarmerResponse>();
  var farmer = Rx<Farmer>(Farmer());

  @override
  onInit() async {
    super.onInit();
    await loadFarmer();
  }

  loadFarmer() async {
    try {
      error.value = false;
      ready.value = false;
      response = await provider.getFarmer();

      // Lỗi mạng
      if (!response.isOk) {
        toast(content: response.statusText);
        error.value = true;
        ready.value = true;
        return;
      }

      // Lỗi server
      if (response.body.code != 200) {
        toast(content: 'Server error: ' + response.body.message);
        error.value = true;
        ready.value = true;
        return;
      }

      // toast(content: response.body.toJson().toString());
      if (response.body != null && response.body.farmer != null) {
        farmer.value = response.body.farmer;
        error.value = false;
        ready.value = true;
      }
    } catch (e) {
      toast(content: 'Server error: ' + e.toString());
      error.value = true;
      ready.value = true;
    }
  }
}
