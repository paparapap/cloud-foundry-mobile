///
//  Generated code. Do not modify.
//  source: metric.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class ValueMetric extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ValueMetric', package: const $pb.PackageName('events'))
    ..aQS(1, 'name')
    ..a<double>(2, 'value', $pb.PbFieldType.QD)
    ..aQS(3, 'unit')
  ;

  ValueMetric() : super();
  ValueMetric.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ValueMetric.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ValueMetric clone() => new ValueMetric()..mergeFromMessage(this);
  ValueMetric copyWith(void Function(ValueMetric) updates) => super.copyWith((message) => updates(message as ValueMetric));
  $pb.BuilderInfo get info_ => _i;
  static ValueMetric create() => new ValueMetric();
  static $pb.PbList<ValueMetric> createRepeated() => new $pb.PbList<ValueMetric>();
  static ValueMetric getDefault() => _defaultInstance ??= create()..freeze();
  static ValueMetric _defaultInstance;
  static void $checkItem(ValueMetric v) {
    if (v is! ValueMetric) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get name => $_getS(0, '');
  set name(String v) { $_setString(0, v); }
  bool hasName() => $_has(0);
  void clearName() => clearField(1);

  double get value => $_getN(1);
  set value(double v) { $_setDouble(1, v); }
  bool hasValue() => $_has(1);
  void clearValue() => clearField(2);

  String get unit => $_getS(2, '');
  set unit(String v) { $_setString(2, v); }
  bool hasUnit() => $_has(2);
  void clearUnit() => clearField(3);
}

class CounterEvent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('CounterEvent', package: const $pb.PackageName('events'))
    ..aQS(1, 'name')
    ..a<Int64>(2, 'delta', $pb.PbFieldType.QU6, Int64.ZERO)
    ..a<Int64>(3, 'total', $pb.PbFieldType.OU6, Int64.ZERO)
  ;

  CounterEvent() : super();
  CounterEvent.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  CounterEvent.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  CounterEvent clone() => new CounterEvent()..mergeFromMessage(this);
  CounterEvent copyWith(void Function(CounterEvent) updates) => super.copyWith((message) => updates(message as CounterEvent));
  $pb.BuilderInfo get info_ => _i;
  static CounterEvent create() => new CounterEvent();
  static $pb.PbList<CounterEvent> createRepeated() => new $pb.PbList<CounterEvent>();
  static CounterEvent getDefault() => _defaultInstance ??= create()..freeze();
  static CounterEvent _defaultInstance;
  static void $checkItem(CounterEvent v) {
    if (v is! CounterEvent) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get name => $_getS(0, '');
  set name(String v) { $_setString(0, v); }
  bool hasName() => $_has(0);
  void clearName() => clearField(1);

  Int64 get delta => $_getI64(1);
  set delta(Int64 v) { $_setInt64(1, v); }
  bool hasDelta() => $_has(1);
  void clearDelta() => clearField(2);

  Int64 get total => $_getI64(2);
  set total(Int64 v) { $_setInt64(2, v); }
  bool hasTotal() => $_has(2);
  void clearTotal() => clearField(3);
}

class ContainerMetric extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ContainerMetric', package: const $pb.PackageName('events'))
    ..aQS(1, 'applicationId')
    ..a<int>(2, 'instanceIndex', $pb.PbFieldType.Q3)
    ..a<double>(3, 'cpuPercentage', $pb.PbFieldType.QD)
    ..a<Int64>(4, 'memoryBytes', $pb.PbFieldType.QU6, Int64.ZERO)
    ..a<Int64>(5, 'diskBytes', $pb.PbFieldType.QU6, Int64.ZERO)
    ..a<Int64>(6, 'memoryBytesQuota', $pb.PbFieldType.OU6, Int64.ZERO)
    ..a<Int64>(7, 'diskBytesQuota', $pb.PbFieldType.OU6, Int64.ZERO)
  ;

  ContainerMetric() : super();
  ContainerMetric.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ContainerMetric.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ContainerMetric clone() => new ContainerMetric()..mergeFromMessage(this);
  ContainerMetric copyWith(void Function(ContainerMetric) updates) => super.copyWith((message) => updates(message as ContainerMetric));
  $pb.BuilderInfo get info_ => _i;
  static ContainerMetric create() => new ContainerMetric();
  static $pb.PbList<ContainerMetric> createRepeated() => new $pb.PbList<ContainerMetric>();
  static ContainerMetric getDefault() => _defaultInstance ??= create()..freeze();
  static ContainerMetric _defaultInstance;
  static void $checkItem(ContainerMetric v) {
    if (v is! ContainerMetric) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get applicationId => $_getS(0, '');
  set applicationId(String v) { $_setString(0, v); }
  bool hasApplicationId() => $_has(0);
  void clearApplicationId() => clearField(1);

  int get instanceIndex => $_get(1, 0);
  set instanceIndex(int v) { $_setSignedInt32(1, v); }
  bool hasInstanceIndex() => $_has(1);
  void clearInstanceIndex() => clearField(2);

  double get cpuPercentage => $_getN(2);
  set cpuPercentage(double v) { $_setDouble(2, v); }
  bool hasCpuPercentage() => $_has(2);
  void clearCpuPercentage() => clearField(3);

  Int64 get memoryBytes => $_getI64(3);
  set memoryBytes(Int64 v) { $_setInt64(3, v); }
  bool hasMemoryBytes() => $_has(3);
  void clearMemoryBytes() => clearField(4);

  Int64 get diskBytes => $_getI64(4);
  set diskBytes(Int64 v) { $_setInt64(4, v); }
  bool hasDiskBytes() => $_has(4);
  void clearDiskBytes() => clearField(5);

  Int64 get memoryBytesQuota => $_getI64(5);
  set memoryBytesQuota(Int64 v) { $_setInt64(5, v); }
  bool hasMemoryBytesQuota() => $_has(5);
  void clearMemoryBytesQuota() => clearField(6);

  Int64 get diskBytesQuota => $_getI64(6);
  set diskBytesQuota(Int64 v) { $_setInt64(6, v); }
  bool hasDiskBytesQuota() => $_has(6);
  void clearDiskBytesQuota() => clearField(7);
}

