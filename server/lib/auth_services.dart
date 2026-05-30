import 'package:bcrypt/bcrypt.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:protos/protos.dart';
import 'package:server/collections.dart';
import 'package:server/jwt_services.dart';
import 'package:server/mogo_service.dart';
import 'env.dart';

class AuthServices extends AuthServiceBase {
  final MongoService mogoservice;
  AuthServices(this.mogoservice);

  @override
  Future<LoginResponse> login(ServiceCall call, LoginRequest request) async {
    try {
      final usersCollection = mogoservice.collection(Collections.users);

      final userData = await usersCollection.findOne({
        r"$or": [
          {"email": request.identifier},
          {"username": request.identifier},
        ],
      });

      if (userData == null) {
        throw GrpcError.unauthenticated("Invalid credentials");
      }

      if (!(userData["is_active"] ?? false)) {
        throw GrpcError.permissionDenied(
          "Account disabled, please contact ADMIN",
        );
      }

      final pepper = env['PASSWORD_PEPPER'];

      if (pepper == null || pepper.isEmpty) {
        throw GrpcError.internal("Authentication unavailable");
      }

      final isPasswordValid = BCrypt.checkpw(
        request.password + pepper,
        userData["password"],
      );

      if (!isPasswordValid) {
        throw GrpcError.unauthenticated("Invalid credentials");
      }

      final token = JwtService().generateToken(
        userId: userData["_id"].toString(),
        role: UserRole.valueOf(userData["role"])?.name ?? "UNKNOWN",
      );

      // final user = User(
      //   id: userData["_id"].toString(),
      //   name: userData["name"] ?? "",
      //   username: userData["username"] ?? "",
      //   email: userData["email"] ?? "",
      //   phone: userData["phone"] ?? "",
      //   role: UserRole.valueOf(userData["role"]) ?? UserRole.UNKNOWN,
      //   isActive: userData["is_active"] ?? false,
      // );
      final userRole = UserRole.valueOf(userData["role"]) ?? UserRole.UNKNOWN;
      return LoginResponse(token: token, role: userRole);
    } on GrpcError {
      rethrow;
    } catch (e, stackTrace) {
      print("Login error: $e");
      print(stackTrace);
      throw GrpcError.internal("Something went wrong during login");
    }
  }

  @override
  Future<RegisterResponse> registerTeacher(
    ServiceCall call,
    RegisterTeacherRequest request,
  ) async {
    try {
      final usersCollection = mogoservice.collection(Collections.users);

      final existingUser = await usersCollection.findOne(
        where.eq("email", request.email),
      );

      if (existingUser != null) {
        throw GrpcError.alreadyExists("Email already registered");
      }

      final pepper = env['PASSWORD_PEPPER'];

      if (pepper == null || pepper.isEmpty) {
        throw GrpcError.internal("Authentication unavailable");
      }

      final hashedPassword = BCrypt.hashpw(
        request.password + pepper,
        BCrypt.gensalt(),
      );

      await usersCollection.insert({
        "name": request.name,
        "username": request.name.trim().toLowerCase(),
        "email": request.email,
        "phone": request.phone,
        "password": hashedPassword,
        "role": UserRole.STUDENT.value,
        "is_active": true,
      });

      return RegisterResponse(
        message: "User created successfully. Please login again",
      );
    } on GrpcError {
      rethrow;
    } catch (e, stackTrace) {
      print("Login error: $e");
      print(stackTrace);
      throw GrpcError.internal("Something went wrong during login");
    }
  }

  @override
  Future<RegisterResponse> registerStudent(
    ServiceCall call,
    RegisterStudentRequest request,
  ) {
    // TODO: implement registerStudent
    throw UnimplementedError();
  }
}
