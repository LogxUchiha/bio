// ignore_for_file: unused_catch_clause

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      return <BiometricType>[];
    }
  }

static Future<bool> authenticate() async {
  final isAvailable = await hasBiometrics();
  if (!isAvailable) return false;

  try {
    return await _auth.authenticate(
      localizedReason: 'Scan Fingerprint to Authenticate',
    );
  } on PlatformException catch (e) {
    // Handle errors here or show a custom error dialog.
    print('Authentication failed with error: ${e.message}');
    return false;
  }
}
}