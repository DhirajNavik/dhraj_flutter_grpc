// This is a generated file - do not edit.
//
// Generated from profile/profile.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $0;

import 'profile.pb.dart' as $1;

export 'profile.pb.dart';

@$pb.GrpcServiceName('profile.ProfileService')
class ProfileServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  ProfileServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$1.MyProfile> fetchMyProfile(
    $0.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$fetchMyProfile, request, options: options);
  }

  // method descriptors

  static final _$fetchMyProfile = $grpc.ClientMethod<$0.Empty, $1.MyProfile>(
      '/profile.ProfileService/FetchMyProfile',
      ($0.Empty value) => value.writeToBuffer(),
      $1.MyProfile.fromBuffer);
}

@$pb.GrpcServiceName('profile.ProfileService')
abstract class ProfileServiceBase extends $grpc.Service {
  $core.String get $name => 'profile.ProfileService';

  ProfileServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.MyProfile>(
        'FetchMyProfile',
        fetchMyProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.MyProfile value) => value.writeToBuffer()));
  }

  $async.Future<$1.MyProfile> fetchMyProfile_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Empty> $request) async {
    return fetchMyProfile($call, await $request);
  }

  $async.Future<$1.MyProfile> fetchMyProfile(
      $grpc.ServiceCall call, $0.Empty request);
}
