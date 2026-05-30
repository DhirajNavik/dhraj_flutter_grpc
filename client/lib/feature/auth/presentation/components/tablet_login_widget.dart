import 'package:client/config/injector/injector_config.dart';
import 'package:client/core/components/tabbar.dart';
import 'package:client/core/extensions/context_extension.dart';
import 'package:client/core/extensions/responsive_extension.dart';
import 'package:client/core/utils/dimens.dart';
import 'package:client/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:client/feature/auth/presentation/cubit/login_cubit/login_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'staff_form_widget.dart';
import 'parent_student_form_widget.dart';

class TabletLoginWidget extends StatefulWidget {
  const TabletLoginWidget({super.key});

  @override
  State<TabletLoginWidget> createState() => _MobileLoginWigetState();
}

class _MobileLoginWigetState extends State<TabletLoginWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late final AuthBloc schoolViewModel;
  late final AuthBloc parentViewModel;
  late final LoginFormCubit schoolFormCubit;
  late final LoginFormCubit parentFormCubit;

  @override
  void initState() {
    super.initState();
    schoolViewModel = serviceLocater<AuthBloc>();
    parentViewModel = serviceLocater<AuthBloc>();
    schoolFormCubit = serviceLocater<LoginFormCubit>();
    parentFormCubit = serviceLocater<LoginFormCubit>();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (!tabController.indexIsChanging) return;
    if (tabController.index == 0) {
      schoolFormCubit.clear();
    } else {
      parentFormCubit.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final localisation = context.localizations;
    return Expanded(
      child: Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          SizedBox(height: 0.2.screenHeight),
          SizedBox(
            width: 415,
            child: CommonTabBar(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.horizontalspacing,
              ).copyWith(top: Dimens.verticalspacing),
              controller: tabController,
              tabLabels: [
                localisation.staff_login,
                localisation.parent_students,
              ],
            ),
          ),

          Expanded(
            child: SizedBox(
              width: 415,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: schoolViewModel),
                      BlocProvider.value(value: schoolFormCubit),
                    ],
                    child: const StaffFormWidget(),
                  ),
                  MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: parentViewModel),
                      BlocProvider.value(value: parentFormCubit),
                    ],
                    child: const ParentStudentFormWidget(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    schoolViewModel.close();
    parentViewModel.close();
    super.dispose();
  }
}
