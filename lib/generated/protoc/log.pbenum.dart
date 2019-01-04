///
//  Generated code. Do not modify.
//  source: log.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class LogMessage_MessageType extends $pb.ProtobufEnum {
  static const LogMessage_MessageType OUT = const LogMessage_MessageType._(1, 'OUT');
  static const LogMessage_MessageType ERR = const LogMessage_MessageType._(2, 'ERR');

  static const List<LogMessage_MessageType> values = const <LogMessage_MessageType> [
    OUT,
    ERR,
  ];

  static final Map<int, LogMessage_MessageType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static LogMessage_MessageType valueOf(int value) => _byValue[value];
  static void $checkItem(LogMessage_MessageType v) {
    if (v is! LogMessage_MessageType) $pb.checkItemFailed(v, 'LogMessage_MessageType');
  }

  const LogMessage_MessageType._(int v, String n) : super(v, n);
}

