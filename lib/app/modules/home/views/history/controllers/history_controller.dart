import 'package:get/get.dart';

import '../../../../../common/my_getx_controller.dart';
import '../../../../../common/toast.dart';
import '../data/history_model.dart';
import '../data/history_provider.dart';

class HistoryController extends MyGetXController<HistoryProvider> {
  final ready = false.obs;
  Response<HistoryResponse> response;

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
      toast(content: 'Không thể tải lịch sử thanh toán');
      ready.value = true;
      return;
    }

    // Success => Add all new users vao list
    ready.value = true;
  }
}
