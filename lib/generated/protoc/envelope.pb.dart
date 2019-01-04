///
//  Generated code. Do not modify.
//  source: envelope.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'http.pb.dart' as $0;
import 'log.pb.dart' as $1;
import 'metric.pb.dart' as $2;
import 'error.pb.dart' as $3;

import 'envelope.pbenum.dart';

export 'envelope.pbenum.dart';

class Envelope extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Envelope', package: const $pb.PackageName('events'))
    ..aQS(1, 'origin')
    ..e<Envelope_EventType>(2, 'eventType', $pb.PbFieldType.QE, Envelope_EventType.HttpStartStop, Envelope_EventType.valueOf, Envelope_EventType.values)
    ..aInt64(6, 'timestamp')
    ..a<$0.HttpStartStop>(7, 'httpStartStop', $pb.PbFieldType.OM, $0.HttpStartStop.getDefault, $0.HttpStartStop.create)
    ..a<$1.LogMessage>(8, 'logMessage', $pb.PbFieldType.OM, $1.LogMessage.getDefault, $1.LogMessage.create)
    ..a<$2.ValueMetric>(9, 'valueMetric', $pb.PbFieldType.OM, $2.ValueMetric.getDefault, $2.ValueMetric.create)
    ..a<$2.CounterEvent>(10, 'counterEvent', $pb.PbFieldType.OM, $2.CounterEvent.getDefault, $2.CounterEvent.create)
    ..a<$3.Error>(11, 'error', $pb.PbFieldType.OM, $3.Error.getDefault, $3.Error.create)
    ..a<$2.ContainerMetric>(12, 'containerMetric', $pb.PbFieldType.OM, $2.ContainerMetric.getDefault, $2.ContainerMetric.create)
    ..aOS(13, 'deployment')
    ..aOS(14, 'job')
    ..aOS(15, 'index')
    ..aOS(16, 'ip')
    ..m<String, String>(17, 'tags', $pb.PbFieldType.OS, $pb.PbFieldType.OS)
  ;

  Envelope() : super();
  Envelope.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Envelope.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Envelope clone() => new Envelope()..mergeFromMessage(this);
  Envelope copyWith(void Function(Envelope) updates) => super.copyWith((message) => updates(message as Envelope));
  $pb.BuilderInfo get info_ => _i;
  static Envelope create() => new Envelope();
  static $pb.PbList<Envelope> createRepeated() => new $pb.PbList<Envelope>();
  static Envelope getDefault() => _defaultInstance ??= create()..freeze();
  static Envelope _defaultInstance;
  static void $checkItem(Envelope v) {
    if (v is! Envelope) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get origin => $_getS(0, '');
  set origin(String v) { $_setString(0, v); }
  bool hasOrigin() => $_has(0);
  void clearOrigin() => clearField(1);

  Envelope_EventType get eventType => $_getN(1);
  set eventType(Envelope_EventType v) { setField(2, v); }
  bool hasEventType() => $_has(1);
  void clearEventType() => clearField(2);

  Int64 get timestamp => $_getI64(2);
  set timestamp(Int64 v) { $_setInt64(2, v); }
  bool hasTimestamp() => $_has(2);
  void clearTimestamp() => clearField(6);

  $0.HttpStartStop get httpStartStop => $_getN(3);
  set httpStartStop($0.HttpStartStop v) { setField(7, v); }
  bool hasHttpStartStop() => $_has(3);
  void clearHttpStartStop() => clearField(7);

  $1.LogMessage get logMessage => $_getN(4);
  set logMessage($1.LogMessage v) { setField(8, v); }
  bool hasLogMessage() => $_has(4);
  void clearLogMessage() => clearField(8);

  $2.ValueMetric get valueMetric => $_getN(5);
  set valueMetric($2.ValueMetric v) { setField(9, v); }
  bool hasValueMetric() => $_has(5);
  void clearValueMetric() => clearField(9);

  $2.CounterEvent get counterEvent => $_getN(6);
  set counterEvent($2.CounterEvent v) { setField(10, v); }
  bool hasCounterEvent() => $_has(6);
  void clearCounterEvent() => clearField(10);

  $3.Error get error => $_getN(7);
  set error($3.Error v) { setField(11, v); }
  bool hasError() => $_has(7);
  void clearError() => clearField(11);

  $2.ContainerMetric get containerMetric => $_getN(8);
  set containerMetric($2.ContainerMetric v) { setField(12, v); }
  bool hasContainerMetric() => $_has(8);
  void clearContainerMetric() => clearField(12);

  String get deployment => $_getS(9, '');
  set deployment(String v) { $_setString(9, v); }
  bool hasDeployment() => $_has(9);
  void clearDeployment() => clearField(13);

  String get job => $_getS(10, '');
  set job(String v) { $_setString(10, v); }
  bool hasJob() => $_has(10);
  void clearJob() => clearField(14);

  String get index => $_getS(11, '');
  set index(String v) { $_setString(11, v); }
  bool hasIndex() => $_has(11);
  void clearIndex() => clearField(15);

  String get ip => $_getS(12, '');
  set ip(String v) { $_setString(12, v); }
  bool hasIp() => $_has(12);
  void clearIp() => clearField(16);

  Map<String, String> get tags => $_getMap(13);
}

