import 'dart:io';
import 'package:server/auth_services.dart';
import 'package:server/mogo_service.dart';
import 'package:protos/protos.dart';
import 'package:server/profile_services.dart';

void main(List<String> arguments) async {
  final mongo = MongoService();
  await mongo.connect();
  final server = Server.create(
    services: [AuthServices(mongo), ProfileServices(mongo)],
  );
  await server.serve(address: InternetAddress.anyIPv4, port: 8080);
  print("Server listening on port ${server.port}...");
}
