///
//  Generated code. Do not modify.
//  source: log.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'log.pbenum.dart';

export 'log.pbenum.dart';

class LogMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('LogMessage', package: const $pb.PackageName('events'))
    ..a<List<int>>(1, 'message', $pb.PbFieldType.QY)
    ..e<LogMessage_MessageType>(2, 'messageType', $pb.PbFieldType.QE, LogMessage_MessageType.OUT, LogMessage_MessageType.valueOf, LogMessage_MessageType.values)
    ..a<Int64>(3, 'timestamp', $pb.PbFieldType.Q6, Int64.ZERO)
    ..aOS(4, 'appId')
    ..aOS(5, 'sourceType')
    ..aOS(6, 'sourceInstance')
  ;

  LogMessage() : super();
  LogMessage.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  LogMessage.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  LogMessage clone() => new LogMessage()..mergeFromMessage(this);
  LogMessage copyWith(void Function(LogMessage) updates) => super.copyWith((message) => updates(message as LogMessage));
  $pb.BuilderInfo get info_ => _i;
  static LogMessage create() => new LogMessage();
  static $pb.PbList<LogMessage> createRepeated() => new $pb.PbList<LogMessage>();
  static LogMessage getDefault() => _defaultInstance ??= create()..freeze();
  static LogMessage _defaultInstance;
  static void $checkItem(LogMessage v) {
    if (v is! LogMessage) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  List<int> get message => $_getN(0);
  set message(List<int> v) { $_setBytes(0, v); }
  bool hasMessage() => $_has(0);
  void clearMessage() => clearField(1);

  LogMessage_MessageType get messageType => $_getN(1);
  set messageType(LogMessage_MessageType v) { setField(2, v); }
  bool hasMessageType() => $_has(1);
  void clearMessageType() => clearField(2);

  Int64 get timestamp => $_getI64(2);
  set timestamp(Int64 v) { $_setInt64(2, v); }
  bool hasTimestamp() => $_has(2);
  void clearTimestamp() => clearField(3);

  String get appId => $_getS(3, '');
  set appId(String v) { $_setString(3, v); }
  bool hasAppId() => $_has(3);
  void clearAppId() => clearField(4);

  String get sourceType => $_getS(4, '');
  set sourceType(String v) { $_setString(4, v); }
  bool hasSourceType() => $_has(4);
  void clearSourceType() => clearField(5);

  String get sourceInstance => $_getS(5, '');
  set sourceInstance(String v) { $_setString(5, v); }
  bool hasSourceInstance() => $_has(5);
  void clearSourceInstance() => clearField(6);
}

