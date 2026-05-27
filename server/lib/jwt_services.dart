import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'env.dart';

class JwtService {
  JwtService._();

  static final JwtService _instance = JwtService._();

  factory JwtService() => _instance;

  final _secret = env['JWT_SECRET'];

  String generateToken({
    required String userId,
    required String role,
  }) {
    if (_secret == null || _secret.isEmpty) {
      throw Exception("JWT_SECRET missing");
    }

    final jwt = JWT({
      'sub': userId,
      'role': role,
    });

    return jwt.sign(
      SecretKey(_secret),
      expiresIn: const Duration(days: 7),
    );
  }
}