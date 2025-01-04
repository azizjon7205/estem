import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

import '../../shared/data/data_sources/local/app_shared_prefs.dart';
import '../../shared/models/app_lang.dart';
import '../utils/injections.dart';

class Helper {
  /// Get language
  static AppLang getLang() {
    AppLang? lang;
    lang = sl<AppSharedPrefs>().getLang();
    return lang;
  }

  static Future<String?> getUuid() async {
    var uuid = sl<AppSharedPrefs>().getUuid();
    if (uuid != null) {
      return uuid;
    } else {
      var id = await getDeviceUuid();
      if (id != null) {
        sl<AppSharedPrefs>().setUuid(id);
      } else {
        await sl<AppSharedPrefs>().removeUuid();
      }
      return id;
    }
  }

  static Future<String?> getDeviceUuid() async {
    String? identifier;
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        identifier = build.id; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }

    return identifier;
  }

  /// Get Dio Header
  static Future<Map<String, dynamic>> getHeaders() async {
    return {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      'uuid': await getUuid(),
      'push-token': 123,
      "lang": Helper.getLang().code,
      if (sl<AppSharedPrefs>().getAuthToken() != null)
        "authorization": 'Bearer ${sl<AppSharedPrefs>().getAuthToken()!}',
    }..removeWhere((key, value) => value == null);
  }

  static String dateFormat(DateTime date) {
    String formattedDate = DateFormat('dd / MM / yyyy').format(date);
    return formattedDate;
  }

  static String dateFormatWithMonth(DateTime date) {
    String formattedDate = DateFormat('dd MMMM, yyyy').format(date);
    return formattedDate;
  }
}
