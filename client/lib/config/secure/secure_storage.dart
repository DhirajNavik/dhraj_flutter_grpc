import 'dart:async';
import 'package:client/config/secure/access.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:protos/protos.dart';

class SessionController {
  SessionController._();

  static final SessionController instance = SessionController._();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final StreamController<SecureModel?> _controller =
      StreamController<SecureModel?>.broadcast();

  SecureModel? _session;

  /// Stream for UI
  Stream<SecureModel?> get stream => _controller.stream;

  /// Current session (sync access 🔥)
  SecureModel? get current => _session;

  /// Quick token access (for interceptors)
  String? get token => _session?.token;
  UserRole get role => _session?.role ?? UserRole.UNKNOWN;

  /// Init (called in main)
  Future<void> init() async {
    try {
      final token = await _storage.read(key: "token");
      final role = await _storage.read(key: "role");

      if (token != null && role != null) {
        _session = SecureModel(token: token, role: getUserFromString(role));
      } else {
        _session = null;
      }

      _emit();
    } catch (e, s) {
      debugPrint("Session init error: $e");
      debugPrintStack(stackTrace: s);
      _session = null;
      _emit();
    }
  }

  /// Set session (login)
  Future<void> setSession(SecureModel data) async {
    try {
      await Future.wait([
        _storage.write(key: "token", value: data.token),
        _storage.write(key: "role", value: data.role.name),
      ]);

      _session = data;
      _emit();
    } catch (e, s) {
      debugPrint("Set session error: $e");
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  /// Clear session (logout)
  bool _isLoggingOut = false;
  bool get isLoggingOut => _isLoggingOut;

  Future<void> logout() async {
    if (_isLoggingOut) return;
    _isLoggingOut = true;
    try {
      await clearSession();
    } catch (e, s) {
      debugPrint("Logout error: $e");
      debugPrintStack(stackTrace: s);
    } finally {
      _isLoggingOut = false;
    }
  }

  Future<void> clearSession() async {
    try {
      await _storage.deleteAll();
      _session = null;
      _emit();
    } catch (e, s) {
      debugPrint("Clear session error: $e");
      debugPrintStack(stackTrace: s);
      rethrow;
    }
  }

  void _emit() {
    if (!_controller.isClosed) {
      _controller.add(_session);
    }
  }

  void dispose() {
    _controller.close();
  }
}

class SecureModel {
  final String token;
  final UserRole role;

  const SecureModel({required this.token, required this.role});
}
