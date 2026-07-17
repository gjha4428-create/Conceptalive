import 'package:shared_preferences/shared_preferences.dart';
import '../core/utils/logger_util.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  late SharedPreferences _prefs;
  bool _initialized = false;

  StorageService._internal();

  factory StorageService() {
    return _instance;
  }

  Future<void> initialize() async {
    if (!_initialized) {
      try {
        _prefs = await SharedPreferences.getInstance();
        _initialized = true;
        LoggerUtil.info('StorageService initialized');
      } catch (e) {
        LoggerUtil.error('Failed to initialize StorageService', e);
        rethrow;
      }
    }
  }

  Future<bool> setString(String key, String value) async {
    try {
      return await _prefs.setString(key, value);
    } catch (e) {
      LoggerUtil.error('Error setting string for key: $key', e);
      return false;
    }
  }

  String? getString(String key) {
    try {
      return _prefs.getString(key);
    } catch (e) {
      LoggerUtil.error('Error getting string for key: $key', e);
      return null;
    }
  }

  Future<bool> setInt(String key, int value) async {
    try {
      return await _prefs.setInt(key, value);
    } catch (e) {
      LoggerUtil.error('Error setting int for key: $key', e);
      return false;
    }
  }

  int? getInt(String key) {
    try {
      return _prefs.getInt(key);
    } catch (e) {
      LoggerUtil.error('Error getting int for key: $key', e);
      return null;
    }
  }

  Future<bool> setDouble(String key, double value) async {
    try {
      return await _prefs.setDouble(key, value);
    } catch (e) {
      LoggerUtil.error('Error setting double for key: $key', e);
      return false;
    }
  }

  double? getDouble(String key) {
    try {
      return _prefs.getDouble(key);
    } catch (e) {
      LoggerUtil.error('Error getting double for key: $key', e);
      return null;
    }
  }

  Future<bool> setBool(String key, bool value) async {
    try {
      return await _prefs.setBool(key, value);
    } catch (e) {
      LoggerUtil.error('Error setting bool for key: $key', e);
      return false;
    }
  }

  bool? getBool(String key) {
    try {
      return _prefs.getBool(key);
    } catch (e) {
      LoggerUtil.error('Error getting bool for key: $key', e);
      return null;
    }
  }

  Future<bool> setStringList(String key, List<String> value) async {
    try {
      return await _prefs.setStringList(key, value);
    } catch (e) {
      LoggerUtil.error('Error setting string list for key: $key', e);
      return false;
    }
  }

  List<String>? getStringList(String key) {
    try {
      return _prefs.getStringList(key);
    } catch (e) {
      LoggerUtil.error('Error getting string list for key: $key', e);
      return null;
    }
  }

  Future<bool> remove(String key) async {
    try {
      return await _prefs.remove(key);
    } catch (e) {
      LoggerUtil.error('Error removing key: $key', e);
      return false;
    }
  }

  Future<bool> clear() async {
    try {
      return await _prefs.clear();
    } catch (e) {
      LoggerUtil.error('Error clearing storage', e);
      return false;
    }
  }

  bool containsKey(String key) {
    try {
      return _prefs.containsKey(key);
    } catch (e) {
      LoggerUtil.error('Error checking if key exists: $key', e);
      return false;
    }
  }
}
