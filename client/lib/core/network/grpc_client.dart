import 'package:protos/protos.dart';

class GrpcClient {
  static ClientChannel get channel => ClientChannel(
    '127.0.0.1',
    port: 8080,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
}