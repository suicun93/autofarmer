import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';

import '../../../common/const.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        fit: StackFit.expand,
        children: [
          FlutterLogin(
            title: 'AutoFarmer',
            logo: controller.logoPath.value,
            onLogin: controller.logIn,
            onSignup: controller.signUp,
            onRecoverPassword: controller.recoverPassword,
            theme: LoginTheme(
              pageColorLight: Color(0xff1E3C72),
              pageColorDark: Color(0xff001341),
              primaryColor: primaryColor,
              titleStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            emailValidator: (email) => null,
            passwordValidator: (password) =>
                password.isEmpty ? 'Nhap password vao' : null,
            onSubmitAnimationCompleted: () => controller.go(Routes.HOME),
            messages: LoginMessages(
              signupButton: 'Đăng ký',
              confirmPasswordHint: 'Xác nhận password',
              loginButton: 'Đăng nhập',
              usernameHint: 'Tài khoản',
              passwordHint: 'Mật khẩu',
              forgotPasswordButton: 'Quên mật khẩu',
              recoverPasswordButton: 'Khôi phục',
              recoverPasswordDescription:
                  'Điền email hoặc số điện thoại bạn đã đăng ký để hồi phục tài khoản.',
              recoverPasswordIntro: 'Khôi phục password',
              recoverPasswordSuccess: 'Khôi phục password thành công',
              goBackButton: 'Quay lại',
              confirmPasswordError: 'Password lỗi',
            ),
          ),
          Positioned(
            right: 0,
            top: 50,
            width: 35,
            child: GestureDetector(
              onTap: () async => controller.changeAvatar(),
              child: Container(
                width: 20,
                height: 35,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
