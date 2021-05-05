import 'package:get/get.dart';

import '../../../../../common/my_getx_controller.dart';
import '../../../../../common/toast.dart';
import '../data/history_model.dart';
import '../data/history_provider.dart';

class HistoryController extends MyGetXController<HistoryProvider> {
  final ready = false.obs;
  Response<HistoryResponse> response;

  final sum = 0.obs;
  final showTong = false.obs;
  num lastTap = DateTime.now().millisecondsSinceEpoch;
  var consecutiveTaps = 0;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    await loadHistory();
  }

  @override
  void onClose() {}

  loadHistory() async {
    sum.value = 0;
    ready.value = false;

    response = await provider.getHistory();

    // Lỗi mạng
    if (!response.isOk && response.statusCode != 400) {
      toast(content: response.statusText);
      ready.value = true;
      return;
    }

    // Lỗi server
    if (!response.body.result.success) {
      toast(content: 'Server error');
      ready.value = true;
      return;
    }

    for (History history in response.body.result.listHistory)
      sum.value = sum.value + history.amount;

    // Success => Add all new users vao list
    ready.value = true;
  }

  void showTongTien() async {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - lastTap < 1000) {
      print("Consecutive tap");
      consecutiveTaps++;
      print("taps = " + consecutiveTaps.toString());
      if (consecutiveTaps == 5) {
        // Do something
        showTong.value = !showTong.value;
      }
    } else
      consecutiveTaps = 0;

    lastTap = now;
  }
}
