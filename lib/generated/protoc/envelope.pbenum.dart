///
//  Generated code. Do not modify.
//  source: envelope.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class Envelope_EventType extends $pb.ProtobufEnum {
  static const Envelope_EventType HttpStartStop = const Envelope_EventType._(4, 'HttpStartStop');
  static const Envelope_EventType LogMessage = const Envelope_EventType._(5, 'LogMessage');
  static const Envelope_EventType ValueMetric = const Envelope_EventType._(6, 'ValueMetric');
  static const Envelope_EventType CounterEvent = const Envelope_EventType._(7, 'CounterEvent');
  static const Envelope_EventType Error = const Envelope_EventType._(8, 'Error');
  static const Envelope_EventType ContainerMetric = const Envelope_EventType._(9, 'ContainerMetric');

  static const List<Envelope_EventType> values = const <Envelope_EventType> [
    HttpStartStop,
    LogMessage,
    ValueMetric,
    CounterEvent,
    Error,
    ContainerMetric,
  ];

  static final Map<int, Envelope_EventType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Envelope_EventType valueOf(int value) => _byValue[value];
  static void $checkItem(Envelope_EventType v) {
    if (v is! Envelope_EventType) $pb.checkItemFailed(v, 'Envelope_EventType');
  }

  const Envelope_EventType._(int v, String n) : super(v, n);
}

