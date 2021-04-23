import 'package:get/get.dart';

import '../../../../../common/const.dart';
import '../../../../../common/my_getx_controller.dart';
import '../../../../../common/toast.dart';
import '../data/clone_model.dart';
import '../data/clone_provider.dart';

class CloneController extends MyGetXController<CloneProvider> {
  final ready = false.obs;
  final error = false.obs;
  final cloneSum = 0.obs;
  final cloneCount = 0.obs;
  final checkPointCloneCount = 0.obs;
  var clones = RxList<Clone>();
  var response = Response<CloneResponse>();
  var selectedRequestType = RequestType.ALL.obs;

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
    cloneSum.value = 0;
    cloneCount.value = 0;
    checkPointCloneCount.value = 0;
    clones = RxList<Clone>();
    response = Response<CloneResponse>();
    // enableCheckpointBtn.value = false;
    await loadClones();
    ready.value = true;
  }

  @override
  void onClose() {}

  loadClones() async {
    try {
      if (clones.isEmpty)
        response = await provider.getClones(
          page: 1,
          requestType: selectedRequestType.value,
        );
      else
        response = await provider.getClones(
          page: clones.length ~/ limit + 1,
          requestType: selectedRequestType.value,
        );

      // Lỗi mạng
      if (!response.isOk) {
        error.value = true;
        toast(content: response.statusText);
        return;
      }

      // Lỗi server
      if (!response.body.result.success) {
        error.value = true;
        toast(content: 'Nothing');
        return;
      }

      // Success => Add all new users vao list
      error.value = false;
      if (response.body.requestType != selectedRequestType.value) return;

      cloneSum.value = response.body.result.total;
      if (response.body.result.listClone != null &&
          response.body.result.listClone.length != 0) {
        for (Clone clone in response.body.result.listClone) {
          clones.add(clone);
          // checkCheckpoint(clone);
        }
        cloneCount.value = clones.length;
      }
    } catch (e) {
      error.value = true;
      toast(content: e.toString());
    }
  }

  bool get showCheckpoint =>
      clones.isNotEmpty && selectedRequestType.value == RequestType.CHECK_POINT;

  void checkCheckpoint(Clone clone) async {
    if (!showCheckpoint) return;
    clone.loading = true;
    clone.error = false;
    clone.checkpoint = false;
    clones.refresh();

    final response = await provider.getCloneImage(id: clone.uid);
    clone.loading = false;

    // Looxi majng
    if (!response.isOk) {
      clone.error = true;
      clones.refresh();
      return;
    }

    // OK
    clone.error = false;
    if (response.headers['content-type'] != 'image/jpeg' ||
        response.headers['x-needle-checksum'] != '3168106802' ||
        response.headers['x-haystack-needlechecksum'] != '674913611' ||
        response.headers['content-length'] != '1327')
      clone.checkpoint = true;
    else
      clone.checkpoint = false;

    checkPointCloneCount.value =
        checkPointCloneCount.value + (clone.checkpoint ? 1 : 0);
    clones.refresh();
  }

  void changeCheckpointStatus(Clone clone) async {
    if (!showCheckpoint) return;

    // OK
    clone.checkpoint = !clone.checkpoint;
    clones.refresh();
  }

  void resetCloneLive() async {
    ready.value = false;

    // Filter
    var listCloneLive = <String>[];
    for (Clone clone in clones)
      if (!clone.checkpoint) listCloneLive.add(clone.id);
    if (listCloneLive.isEmpty) {
      ready.value = true;
      return;
    }

    // Call API
    final response = await provider.resetCloneLive(listCloneLive);

    // Looxi majng
    if (!response.isOk) {
      toast(content: 'Reset Clone thất bại');
      ready.value = true;
      return;
    }

    // OK
    onReady();
  }

  void deleteCheckpoint() async {
    ready.value = false;

    // Filter
    var listCloneCheckpoint = <String>[];
    for (Clone clone in clones)
      if (clone.checkpoint) listCloneCheckpoint.add(clone.id);
    if (listCloneCheckpoint.isEmpty) {
      ready.value = true;
      return;
    }

    // Call API
    final response = await provider.deleteAllClone(listCloneCheckpoint);

    // Looxi majng
    if (!response.isOk) {
      toast(content: 'Xóa Clone thất bại');
      ready.value = true;
      return;
    }

    // OK
    onReady();
  }

  void checkCheckpointAll() async {
    for (Clone clone in clones) {
      checkCheckpoint(clone);
    }
  }

  int get resetLiveCloneCount => clones.length - checkPointCloneCount.value;
  int get checkpointCloneCount => checkPointCloneCount.value;
}
