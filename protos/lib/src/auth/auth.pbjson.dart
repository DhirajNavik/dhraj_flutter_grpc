// This is a generated file - do not edit.
//
// Generated from auth.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userRoleDescriptor instead')
const UserRole$json = {
  '1': 'UserRole',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'ADMIN', '2': 1},
    {'1': 'TEACHER', '2': 2},
    {'1': 'STUDENT', '2': 3},
  ],
};

/// Descriptor for `UserRole`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List userRoleDescriptor = $convert.base64Decode(
    'CghVc2VyUm9sZRILCgdVTktOT1dOEAASCQoFQURNSU4QARILCgdURUFDSEVSEAISCwoHU1RVRE'
    'VOVBAD');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'username', '3': 3, '4': 1, '5': 9, '10': 'username'},
    {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    {'1': 'phone', '3': 5, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'role', '3': 6, '4': 1, '5': 14, '6': '.UserRole', '10': 'role'},
    {'1': 'is_active', '3': 7, '4': 1, '5': 8, '10': 'isActive'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhoKCHVzZXJuYW1lGA'
    'MgASgJUgh1c2VybmFtZRIUCgVlbWFpbBgEIAEoCVIFZW1haWwSFAoFcGhvbmUYBSABKAlSBXBo'
    'b25lEh0KBHJvbGUYBiABKA4yCS5Vc2VyUm9sZVIEcm9sZRIbCglpc19hY3RpdmUYByABKAhSCG'
    'lzQWN0aXZl');

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {'1': 'phone', '3': 4, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVlbWFpbBgCIAEoCVIFZW'
    '1haWwSGgoIcGFzc3dvcmQYAyABKAlSCHBhc3N3b3JkEhQKBXBob25lGAQgASgJUgVwaG9uZQ==');

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'identifier', '3': 1, '4': 1, '5': 9, '10': 'identifier'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSHgoKaWRlbnRpZmllchgBIAEoCVIKaWRlbnRpZmllchIaCghwYXNzd2'
    '9yZBgCIAEoCVIIcGFzc3dvcmQ=');

@$core.Deprecated('Use authResponseDescriptor instead')
const AuthResponse$json = {
  '1': 'AuthResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.User', '10': 'user'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode(
    'CgxBdXRoUmVzcG9uc2USFAoFdG9rZW4YASABKAlSBXRva2VuEhkKBHVzZXIYAiABKAsyBS5Vc2'
    'VyUgR1c2Vy');

@$core.Deprecated('Use successResponseDescriptor instead')
const SuccessResponse$json = {
  '1': 'SuccessResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SuccessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List successResponseDescriptor = $convert.base64Decode(
    'Cg9TdWNjZXNzUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');
