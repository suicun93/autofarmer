import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../../../common/preferences.dart';
import '../../../routes/app_pages.dart';

class InitialController extends GetxController {
  var ready = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Future.delayed(
      Duration(milliseconds: 1100),
      login,
    );
  }

  login() async {
    DatabaseReference usersRef = FirebaseDatabase.instance.reference();

    usersRef.onValue.listen((Event event) async {
      final String user = await Preference.getUsername();
      if (user.isNotEmpty &&
          (event.snapshot.value == null ||
              event.snapshot.value[user] == null)) {
        await Preference.clearAll();
        Get.offAllNamed(Routes.INITIAL);
      }
    }, onError: (Object o) {
      final DatabaseError error = o;
      print('Error: $error');
    });

    final token = await Preference.getToken();
    if (token.isEmpty)
      Get.offAndToNamed(Routes.LOGIN);
    else
      Get.offAndToNamed(Routes.HOME);
  }

  @override
  void onClose() {}
}
