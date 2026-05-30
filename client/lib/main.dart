import 'package:client/config/injector/injector_config.dart';
import 'package:client/my_app.dart';
import 'package:client/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencies();
   runApp(
    MultiBlocProvider(
      providers: AppProviders.provider,
      child: const MyApp(),
    ),
  );
}

