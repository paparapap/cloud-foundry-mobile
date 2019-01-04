///
//  Generated code. Do not modify.
//  source: uuid.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class UUID extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('UUID', package: const $pb.PackageName('events'))
    ..a<Int64>(1, 'low', $pb.PbFieldType.QU6, Int64.ZERO)
    ..a<Int64>(2, 'high', $pb.PbFieldType.QU6, Int64.ZERO)
  ;

  UUID() : super();
  UUID.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  UUID.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  UUID clone() => new UUID()..mergeFromMessage(this);
  UUID copyWith(void Function(UUID) updates) => super.copyWith((message) => updates(message as UUID));
  $pb.BuilderInfo get info_ => _i;
  static UUID create() => new UUID();
  static $pb.PbList<UUID> createRepeated() => new $pb.PbList<UUID>();
  static UUID getDefault() => _defaultInstance ??= create()..freeze();
  static UUID _defaultInstance;
  static void $checkItem(UUID v) {
    if (v is! UUID) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  Int64 get low => $_getI64(0);
  set low(Int64 v) { $_setInt64(0, v); }
  bool hasLow() => $_has(0);
  void clearLow() => clearField(1);

  Int64 get high => $_getI64(1);
  set high(Int64 v) { $_setInt64(1, v); }
  bool hasHigh() => $_has(1);
  void clearHigh() => clearField(2);
}

