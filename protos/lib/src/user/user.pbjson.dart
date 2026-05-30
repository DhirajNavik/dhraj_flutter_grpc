// This is a generated file - do not edit.
//
// Generated from user/user.proto.

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
    {'1': 'role', '3': 6, '4': 1, '5': 14, '6': '.user.UserRole', '10': 'role'},
    {'1': 'is_active', '3': 7, '4': 1, '5': 8, '10': 'isActive'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'updated_at', '3': 9, '4': 1, '5': 3, '10': 'updatedAt'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhoKCHVzZXJuYW1lGA'
    'MgASgJUgh1c2VybmFtZRIUCgVlbWFpbBgEIAEoCVIFZW1haWwSFAoFcGhvbmUYBSABKAlSBXBo'
    'b25lEiIKBHJvbGUYBiABKA4yDi51c2VyLlVzZXJSb2xlUgRyb2xlEhsKCWlzX2FjdGl2ZRgHIA'
    'EoCFIIaXNBY3RpdmUSHQoKY3JlYXRlZF9hdBgIIAEoA1IJY3JlYXRlZEF0Eh0KCnVwZGF0ZWRf'
    'YXQYCSABKANSCXVwZGF0ZWRBdA==');
