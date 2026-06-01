import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos/protos.dart';
import 'package:server/collections.dart';
import 'package:server/jwt_services.dart';
import 'package:server/mogo_service.dart';

class ProfileServices extends ProfileServiceBase {
  final MongoService mogoservice;
  ProfileServices(this.mogoservice);
  @override
  Future<MyProfile> fetchMyProfile(ServiceCall call, Empty request) async {
    try {
      log("Fetching My Profile ....");
      final authHeader = call.clientMetadata?['authorization'];

      if (authHeader == null || !authHeader.startsWith('Bearer ')) {
        throw GrpcError.unauthenticated('Please login again');
      }
      final token = authHeader.substring(7);
      final payload = JwtService().verifyToken(token);
      final userId = payload['sub'] as String;
      final userData = await mogoservice
          .collection(Collections.users)
          .findOne(where.id(ObjectId.fromHexString(userId)));

      if (userData == null) {
        throw GrpcError.unauthenticated("User not found");
      }

      if (!(userData["is_active"] ?? false)) {
        throw GrpcError.unauthenticated("Account disabled");
      }

      return MyProfile(
        user: User(
          id: userData["_id"].toString(),
          name: userData["name"] ?? "",
          username: userData["username"] ?? "",
          email: userData["email"] ?? "",
          phone: userData["phone"] ?? "",
          role: UserRole.valueOf(userData["role"]) ?? UserRole.UNKNOWN,
          isActive: userData["is_active"] ?? false,
        ),
      );
    } on GrpcError {
      rethrow;
    } catch (e, stackTrace) {
      log(e.toString(), name: "PROFILE_SERVICE", stackTrace: stackTrace);
      throw GrpcError.internal('Failed to fetch profile');
    }
  }
}
