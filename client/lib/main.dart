import 'package:client/config/injector/injector_config.dart';
import 'package:client/config/secure/secure_storage.dart';
import 'package:client/my_app.dart';
import 'package:client/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SessionController.instance.init();
  initDependencies();
  runApp(
    MultiBlocProvider(providers: AppProviders.provider, child: const MyApp()),
  );
}
