///
//  Generated code. Do not modify.
//  source: error.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:protobuf/protobuf.dart' as $pb;

class Error extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Error', package: const $pb.PackageName('events'))
    ..aQS(1, 'source')
    ..a<int>(2, 'code', $pb.PbFieldType.Q3)
    ..aQS(3, 'message')
  ;

  Error() : super();
  Error.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Error.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Error clone() => new Error()..mergeFromMessage(this);
  Error copyWith(void Function(Error) updates) => super.copyWith((message) => updates(message as Error));
  $pb.BuilderInfo get info_ => _i;
  static Error create() => new Error();
  static $pb.PbList<Error> createRepeated() => new $pb.PbList<Error>();
  static Error getDefault() => _defaultInstance ??= create()..freeze();
  static Error _defaultInstance;
  static void $checkItem(Error v) {
    if (v is! Error) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  String get source => $_getS(0, '');
  set source(String v) { $_setString(0, v); }
  bool hasSource() => $_has(0);
  void clearSource() => clearField(1);

  int get code => $_get(1, 0);
  set code(int v) { $_setSignedInt32(1, v); }
  bool hasCode() => $_has(1);
  void clearCode() => clearField(2);

  String get message => $_getS(2, '');
  set message(String v) { $_setString(2, v); }
  bool hasMessage() => $_has(2);
  void clearMessage() => clearField(3);
}

