import 'package:client/feature/auth/data/datasources/auth_datasource_grpc.dart';
import 'package:client/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:client/feature/auth/domain/params/login_params.dart';
import 'package:client/feature/auth/domain/params/register_params.dart';
import 'package:client/feature/auth/domain/usecases/student_register.dart';
import 'package:client/feature/auth/domain/usecases/user_login.dart';
import 'package:client/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protos/protos.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late ClientChannel _channel;
  late AuthServiceClient _stub;

  @override
  void initState() {
    super.initState();
    _channel = ClientChannel(
      '127.0.0.1',
      port: 8080,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    _stub = AuthServiceClient(_channel);
  }

  @override
  Widget build(BuildContext context) {
    final authDatasource = AuthDatasourceGrpc(_stub);
    final authRepository = AuthRepositoryImpl(authDatasource);
    final loginUseCase = UserLoginUseCase(authRepository);
    final studentRegisterUseCase = StudentRegisterUseCase(authRepository);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(loginUseCase, studentRegisterUseCase),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            home: Scaffold(
              body: Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .center,
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          AuthEvent.registerStudent(
                            StudentRegisterParams(
                              name: "Dhiraj Navik",
                              email: "dhiraj@gmail.com",
                              password: "123@Dhiraj",
                              phone: "9866717428",
                            ),
                          ),
                        );
                      },
                      child: Text("Register"),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        AuthEvent.loginSubmitted(
                          LoginParams(
                            // name: "Dhiraj Navik",
                            identifier: "dhiraj@gmail.com",
                            password: "123@Dhiraj",
                          ),
                        ),
                      );
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
