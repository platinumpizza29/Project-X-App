///
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = const {
  '1': 'ChatMessage',
  '2': const [
    const {'1': 'senderID', '3': 1, '4': 1, '5': 9, '10': 'senderID'},
    const {'1': 'channelName', '3': 2, '4': 1, '5': 9, '10': 'channelName'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode('CgtDaGF0TWVzc2FnZRIaCghzZW5kZXJJRBgBIAEoCVIIc2VuZGVySUQSIAoLY2hhbm5lbE5hbWUYAiABKAlSC2NoYW5uZWxOYW1lEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use messageAckDescriptor instead')
const MessageAck$json = const {
  '1': 'MessageAck',
};

/// Descriptor for `MessageAck`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageAckDescriptor = $convert.base64Decode('CgpNZXNzYWdlQWNr');
@$core.Deprecated('Use connectionRequestDescriptor instead')
const ConnectionRequest$json = const {
  '1': 'ConnectionRequest',
  '2': const [
    const {'1': 'userID', '3': 1, '4': 1, '5': 9, '10': 'userID'},
    const {'1': 'channelName', '3': 2, '4': 1, '5': 9, '10': 'channelName'},
  ],
};

/// Descriptor for `ConnectionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectionRequestDescriptor = $convert.base64Decode('ChFDb25uZWN0aW9uUmVxdWVzdBIWCgZ1c2VySUQYASABKAlSBnVzZXJJRBIgCgtjaGFubmVsTmFtZRgCIAEoCVILY2hhbm5lbE5hbWU=');
@$core.Deprecated('Use successEmptyResponseDescriptor instead')
const SuccessEmptyResponse$json = const {
  '1': 'SuccessEmptyResponse',
};

/// Descriptor for `SuccessEmptyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List successEmptyResponseDescriptor = $convert.base64Decode('ChRTdWNjZXNzRW1wdHlSZXNwb25zZQ==');
