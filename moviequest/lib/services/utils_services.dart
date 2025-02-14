import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilsServices {
  static final _storage = const FlutterSecureStorage();

  static Future<void> saveLocalData(
      {required String key, required String data}) async {
    await _storage.write(key: key, value: data);
  }

  Future<String?> getlocalData({required String key}) async {
    return await _storage.read(key: key);
  }

  Future<void> removeLocalData({required String key}) async {
    await _storage.delete(key: key);
  }

  static void showToast({required message, bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: isError ? Colors.white : Colors.black,
      fontSize: 14.0,
    );
  }
}
