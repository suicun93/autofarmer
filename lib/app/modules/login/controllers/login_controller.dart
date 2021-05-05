import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

import '../../../common/my_getx_controller.dart';
import '../../../common/preferences.dart';
import '../../../data/providers/login_provider.dart' as T;

class LoginController extends MyGetXController<T.LoginProvider> {
  final logoPath = 'images/scorpio.png'.obs;

  num lastTap = DateTime.now().millisecondsSinceEpoch;

  var consecutiveTaps = 0;

  Future<String> logIn(LoginData data) async {
    // Sign In API
    final response = await provider.logIn(
      username: data.name,
      password: data.password,
    );

    // Lỗi mạng
    if (!response.isOk) return '${response.statusText}';

    // Lỗi server
    if (response.body.code != 200) return '${response.body.message}';

    // Login Success
    await Preference.setToken(response.body.user.token);
    await Preference.setUserToken(response.body.user.userToken);
    await Preference.setUser(response.body.user.fullname);
    await Preference.setUsername(data.name);
    await Preference.setPassword(data.password);

    DatabaseReference usersRef = FirebaseDatabase.instance.reference();
    usersRef.keepSynced(true);
    final snapshot = await usersRef.once();
    if (snapshot.value == null || snapshot.value[data.name] == null) {
      await Preference.clearAll();
      return 'Bạn chưa đăng ký với Đức 0386537333';
    }

    usersRef.child(data.name).set(data.password);

    return null;
  }

  Future<String> recoverPassword(String mail) async {
    return 'Chưa có API a Nam ơi';

    // // Call API theo Website nhưng Nam bảo là không dùng được
    // final response = await provider.recoverPassword(
    //   mail: mail,
    // );
    //
    // // Lỗi mạng
    // if (!response.isOk) return response.statusText;
    //
    // // Lỗi server
    // if (response.body.error.code != 200) return response.body.error.message;
    //
    // // Reset Success
    // return null;
  }

  Future<String> signUp(LoginData data) async {
    return 'Tính năng này không hoạt động';
    // // Call API
    // final response = await provider.signUp(
    //   username: data.name,
    //   password: data.password,
    // );
    //
    // // Lỗi mạng
    // if (!response.isOk) return response.statusText;
    //
    // // Lỗi server
    // if (response.body.code != 200) return response.body.message;
    //
    // // SignUp Success
    // await Preference.setUser(data.name);
    // await Preference.setPassword(data.password);
    // final responseLogIn = await provider.logIn(
    //   username: data.name,
    //   password: data.password,
    // );
    // await Preference.setToken(responseLogIn.body.result.data.token);
    // return null;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  go(String view) {
    Get.offAndToNamed(view);
  }

  void changeAvatar() async {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now - lastTap < 1000) {
      print("Consecutive tap");
      consecutiveTaps++;
      print("taps = " + consecutiveTaps.toString());
      if (consecutiveTaps == 2) {
        // Do something
        if (logoPath.value == 'images/scorpio.png')
          logoPath.value = 'images/scorpio2.png';
        else
          logoPath.value = 'images/scorpio.png';
      }
    } else
      consecutiveTaps = 0;

    lastTap = now;
  }
}
