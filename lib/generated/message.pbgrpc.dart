///
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'message.pb.dart' as $0;
export 'message.pb.dart';

class ChatMessageServiceClient extends $grpc.Client {
  static final _$chat =
      $grpc.ClientMethod<$0.ChatMessageRequest, $0.ChatMessageResponse>(
          '/msgapi.ChatMessageService/chat',
          ($0.ChatMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ChatMessageResponse.fromBuffer(value));

  ChatMessageServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.ChatMessageResponse> chat(
      $async.Stream<$0.ChatMessageRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$chat, request, options: options);
  }
}

abstract class ChatMessageServiceBase extends $grpc.Service {
  $core.String get $name => 'msgapi.ChatMessageService';

  ChatMessageServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.ChatMessageRequest, $0.ChatMessageResponse>(
            'chat',
            chat,
            true,
            true,
            ($core.List<$core.int> value) =>
                $0.ChatMessageRequest.fromBuffer(value),
            ($0.ChatMessageResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ChatMessageResponse> chat(
      $grpc.ServiceCall call, $async.Stream<$0.ChatMessageRequest> request);
}
