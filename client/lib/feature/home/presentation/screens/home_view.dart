import 'package:client/config/injector/injector_config.dart';
import 'package:client/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ProfileBloc bloc;
  @override
  void initState() {
    bloc = serviceLocater<ProfileBloc>();
    bloc.add(MyProfile());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: Column(
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return Text(
                  state.maybeWhen(
                    orElse: () => "Fetching",
                    loading: () => "loading...",
                    myProfile: (user) => user.name,
                  ),
                  style: TextStyle(fontSize: 20, color: Colors.black),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
