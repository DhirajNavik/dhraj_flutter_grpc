part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.myProfile(UserModelEntity user) = _MyProfile;
  const factory ProfileState.error(String message) = _Error;
}
