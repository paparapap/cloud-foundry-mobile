///
//  Generated code. Do not modify.
//  source: http.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'uuid.pb.dart' as $0;

import 'http.pbenum.dart';

export 'http.pbenum.dart';

class HttpStartStop extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('HttpStartStop', package: const $pb.PackageName('events'))
    ..a<Int64>(1, 'startTimestamp', $pb.PbFieldType.Q6, Int64.ZERO)
    ..a<Int64>(2, 'stopTimestamp', $pb.PbFieldType.Q6, Int64.ZERO)
    ..a<$0.UUID>(3, 'requestId', $pb.PbFieldType.QM, $0.UUID.getDefault, $0.UUID.create)
    ..e<PeerType>(4, 'peerType', $pb.PbFieldType.QE, PeerType.Client, PeerType.valueOf, PeerType.values)
    ..e<Method>(5, 'method', $pb.PbFieldType.QE, Method.GET, Method.valueOf, Method.values)
    ..aQS(6, 'uri')
    ..aQS(7, 'remoteAddress')
    ..aQS(8, 'userAgent')
    ..a<int>(9, 'statusCode', $pb.PbFieldType.Q3)
    ..a<Int64>(10, 'contentLength', $pb.PbFieldType.Q6, Int64.ZERO)
    ..a<$0.UUID>(12, 'applicationId', $pb.PbFieldType.OM, $0.UUID.getDefault, $0.UUID.create)
    ..a<int>(13, 'instanceIndex', $pb.PbFieldType.O3)
    ..aOS(14, 'instanceId')
    ..pPS(15, 'forwarded')
  ;

  HttpStartStop() : super();
  HttpStartStop.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  HttpStartStop.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  HttpStartStop clone() => new HttpStartStop()..mergeFromMessage(this);
  HttpStartStop copyWith(void Function(HttpStartStop) updates) => super.copyWith((message) => updates(message as HttpStartStop));
  $pb.BuilderInfo get info_ => _i;
  static HttpStartStop create() => new HttpStartStop();
  static $pb.PbList<HttpStartStop> createRepeated() => new $pb.PbList<HttpStartStop>();
  static HttpStartStop getDefault() => _defaultInstance ??= create()..freeze();
  static HttpStartStop _defaultInstance;
  static void $checkItem(HttpStartStop v) {
    if (v is! HttpStartStop) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  Int64 get startTimestamp => $_getI64(0);
  set startTimestamp(Int64 v) { $_setInt64(0, v); }
  bool hasStartTimestamp() => $_has(0);
  void clearStartTimestamp() => clearField(1);

  Int64 get stopTimestamp => $_getI64(1);
  set stopTimestamp(Int64 v) { $_setInt64(1, v); }
  bool hasStopTimestamp() => $_has(1);
  void clearStopTimestamp() => clearField(2);

  $0.UUID get requestId => $_getN(2);
  set requestId($0.UUID v) { setField(3, v); }
  bool hasRequestId() => $_has(2);
  void clearRequestId() => clearField(3);

  PeerType get peerType => $_getN(3);
  set peerType(PeerType v) { setField(4, v); }
  bool hasPeerType() => $_has(3);
  void clearPeerType() => clearField(4);

  Method get method => $_getN(4);
  set method(Method v) { setField(5, v); }
  bool hasMethod() => $_has(4);
  void clearMethod() => clearField(5);

  String get uri => $_getS(5, '');
  set uri(String v) { $_setString(5, v); }
  bool hasUri() => $_has(5);
  void clearUri() => clearField(6);

  String get remoteAddress => $_getS(6, '');
  set remoteAddress(String v) { $_setString(6, v); }
  bool hasRemoteAddress() => $_has(6);
  void clearRemoteAddress() => clearField(7);

  String get userAgent => $_getS(7, '');
  set userAgent(String v) { $_setString(7, v); }
  bool hasUserAgent() => $_has(7);
  void clearUserAgent() => clearField(8);

  int get statusCode => $_get(8, 0);
  set statusCode(int v) { $_setSignedInt32(8, v); }
  bool hasStatusCode() => $_has(8);
  void clearStatusCode() => clearField(9);

  Int64 get contentLength => $_getI64(9);
  set contentLength(Int64 v) { $_setInt64(9, v); }
  bool hasContentLength() => $_has(9);
  void clearContentLength() => clearField(10);

  $0.UUID get applicationId => $_getN(10);
  set applicationId($0.UUID v) { setField(12, v); }
  bool hasApplicationId() => $_has(10);
  void clearApplicationId() => clearField(12);

  int get instanceIndex => $_get(11, 0);
  set instanceIndex(int v) { $_setSignedInt32(11, v); }
  bool hasInstanceIndex() => $_has(11);
  void clearInstanceIndex() => clearField(13);

  String get instanceId => $_getS(12, '');
  set instanceId(String v) { $_setString(12, v); }
  bool hasInstanceId() => $_has(12);
  void clearInstanceId() => clearField(14);

  List<String> get forwarded => $_getList(13);
}

