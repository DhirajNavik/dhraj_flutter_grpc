import 'dart:async';

import 'package:client/core/usecases/usecase.dart';
import 'package:client/feature/profile/domain/entities/user_model_entitiy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/usecases/my_profile.dart';

part 'profile_bloc.freezed.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {


  final MyProfileUseCase _myProfileUseCase;
  ProfileBloc(this._myProfileUseCase) : super(const ProfileState.initial()) {
    on<MyProfile>(_onMyProfile);
  }

  FutureOr<void> _onMyProfile(
    MyProfile event,
    Emitter<ProfileState> emit,
  ) async {
    
    emit(const ProfileState.loading());

    final result = await _myProfileUseCase(NoParams());

    result.match(
      (failure) {
        emit(ProfileState.error(failure.message));
      },
      (response) async {
        emit(ProfileState.myProfile(response));
      },
    );
  }
}
