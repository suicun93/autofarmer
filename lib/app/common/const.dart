import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'toast.dart';

enum Environment { PRODUCTION, TEST, DEV }

// Base URL
const currentEnvironment = Environment.DEV;

get endpointApi => currentEnvironment == Environment.PRODUCTION
    ? 'https://api-web.autofarmer.net/public-api/v1/users'
    : 'https://api-web.autofarmer.net/public-api/v1/users';

// App primary color
const Color primaryColor = Color(0xff1E3C72);

// Splashscreen logo path
const logo = 'images/scorpio.png';
const loadingLogo = 'images/loading.jpg';

// Use this photo if user don't have avatar
const noPhoto = 'images/noPhoto.jpeg';

const mobileSecretKey = '3953390b-42bb-11eb-9f8b-1111914b71be';

const authorization = 'Basic Y29uZ2F1YmVvQDEyMzpjb25nYXViZW9AMTIz';

// Valid date
DateTime _valid(DateTime dateTime) => (dateTime ?? DateTime.now()).toLocal();

// Format date
final _formatter = DateFormat('yyyy-MM-dd HH:mm');
final _formatterDate = DateFormat('yyyy-MM-dd');
final _formatterDate2 = DateFormat('dd-MM');

String formatDatetime(dateTime) => _formatter.format(_valid(dateTime));

String formatDate(dateTime) => _formatterDate.format(_valid(dateTime));

String formatDate2(dateTime) => _formatterDate2.format(_valid(dateTime));

// Format money
final numberFormatter = NumberFormat('#,###');

// Limit request
final limit = 100;

copyToClipboard(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
  toast(content: 'Copied $text');
}

final _numeric = RegExp(r'^-?[0-9]+$');

extension CheckID on String {
  bool get isNumber {
    if (this == null) return false;
    return _numeric.hasMatch(this);
  }
}

toFanPage(String id) async {
  if (!id.isNumber) {
    // Open Safari
    await launch(
      'https://www.facebook.com/$id/',
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    // Open facebook
    var protocol = '';
    if (Platform.isAndroid)
      protocol = 'fb://page/';
    else if (Platform.isIOS || Platform.isMacOS) protocol = 'fb://profile/';

    try {
      bool launched = await launch(
        '$protocol$id',
        forceSafariVC: false,
        forceWebView: false,
      );
      if (!launched) {
        await launch(
          'https://www.facebook.com/$id/',
          forceSafariVC: false,
          forceWebView: false,
        );
      }
    } catch (e) {
      await launch(
        'https://www.facebook.com/$id/',
        forceSafariVC: false,
        forceWebView: false,
      );
    }
  }
}

Function showConfirmDialog(String title, Function onConfirm) {
  // Set up the buttons
  final cancelButton = FlatButton(
    child: Text(
      'Hủy',
      style: TextStyle(color: Colors.red),
    ),
    onPressed: () => Get.back(),
  );
  final continueButton = FlatButton(
    child: Text('Đồng ý'),
    onPressed: () {
      Get.back();
      onConfirm();
    },
  );

  // Set up the AlertDialog
  final alert = AlertDialog(
    title: Text('Xác nhận'),
    content: Text(title),
    actions: [
      continueButton,
      cancelButton,
    ],
  );

  // Show the dialog
  return () => showDialog(
        context: Get.context,
        builder: (BuildContext context) {
          return alert;
        },
      );
}

bool get isTablet =>
    sqrt((Get.size.width * Get.size.width) +
        (Get.size.height * Get.size.height)) >
    1100;

bool get displayMobile => false;
