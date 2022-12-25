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
  static final _$sendMessage =
      $grpc.ClientMethod<$0.ChatMessage, $0.MessageAck>(
          '/msgapi.ChatMessageService/SendMessage',
          ($0.ChatMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.MessageAck.fromBuffer(value));
  static final _$joinChannel =
      $grpc.ClientMethod<$0.ConnectionRequest, $0.ChatMessage>(
          '/msgapi.ChatMessageService/JoinChannel',
          ($0.ConnectionRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.ChatMessage.fromBuffer(value));

  ChatMessageServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.MessageAck> sendMessage(
      $async.Stream<$0.ChatMessage> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$sendMessage, request, options: options)
        .single;
  }

  $grpc.ResponseStream<$0.ChatMessage> joinChannel($0.ConnectionRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$joinChannel, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class ChatMessageServiceBase extends $grpc.Service {
  $core.String get $name => 'msgapi.ChatMessageService';

  ChatMessageServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ChatMessage, $0.MessageAck>(
        'SendMessage',
        sendMessage,
        true,
        false,
        ($core.List<$core.int> value) => $0.ChatMessage.fromBuffer(value),
        ($0.MessageAck value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ConnectionRequest, $0.ChatMessage>(
        'JoinChannel',
        joinChannel_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ConnectionRequest.fromBuffer(value),
        ($0.ChatMessage value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ChatMessage> joinChannel_Pre($grpc.ServiceCall call,
      $async.Future<$0.ConnectionRequest> request) async* {
    yield* joinChannel(call, await request);
  }

  $async.Future<$0.MessageAck> sendMessage(
      $grpc.ServiceCall call, $async.Stream<$0.ChatMessage> request);
  $async.Stream<$0.ChatMessage> joinChannel(
      $grpc.ServiceCall call, $0.ConnectionRequest request);
}
