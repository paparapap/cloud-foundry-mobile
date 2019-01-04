///
//  Generated code. Do not modify.
//  source: http.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' show int, dynamic, String, List, Map;
import 'package:protobuf/protobuf.dart' as $pb;

class PeerType extends $pb.ProtobufEnum {
  static const PeerType Client = const PeerType._(1, 'Client');
  static const PeerType Server = const PeerType._(2, 'Server');

  static const List<PeerType> values = const <PeerType> [
    Client,
    Server,
  ];

  static final Map<int, PeerType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PeerType valueOf(int value) => _byValue[value];
  static void $checkItem(PeerType v) {
    if (v is! PeerType) $pb.checkItemFailed(v, 'PeerType');
  }

  const PeerType._(int v, String n) : super(v, n);
}

class Method extends $pb.ProtobufEnum {
  static const Method GET = const Method._(1, 'GET');
  static const Method POST = const Method._(2, 'POST');
  static const Method PUT = const Method._(3, 'PUT');
  static const Method DELETE = const Method._(4, 'DELETE');
  static const Method HEAD = const Method._(5, 'HEAD');
  static const Method ACL = const Method._(6, 'ACL');
  static const Method BASELINE_CONTROL = const Method._(7, 'BASELINE_CONTROL');
  static const Method BIND = const Method._(8, 'BIND');
  static const Method CHECKIN = const Method._(9, 'CHECKIN');
  static const Method CHECKOUT = const Method._(10, 'CHECKOUT');
  static const Method CONNECT = const Method._(11, 'CONNECT');
  static const Method COPY = const Method._(12, 'COPY');
  static const Method DEBUG = const Method._(13, 'DEBUG');
  static const Method LABEL = const Method._(14, 'LABEL');
  static const Method LINK = const Method._(15, 'LINK');
  static const Method LOCK = const Method._(16, 'LOCK');
  static const Method MERGE = const Method._(17, 'MERGE');
  static const Method MKACTIVITY = const Method._(18, 'MKACTIVITY');
  static const Method MKCALENDAR = const Method._(19, 'MKCALENDAR');
  static const Method MKCOL = const Method._(20, 'MKCOL');
  static const Method MKREDIRECTREF = const Method._(21, 'MKREDIRECTREF');
  static const Method MKWORKSPACE = const Method._(22, 'MKWORKSPACE');
  static const Method MOVE = const Method._(23, 'MOVE');
  static const Method OPTIONS = const Method._(24, 'OPTIONS');
  static const Method ORDERPATCH = const Method._(25, 'ORDERPATCH');
  static const Method PATCH = const Method._(26, 'PATCH');
  static const Method PRI = const Method._(27, 'PRI');
  static const Method PROPFIND = const Method._(28, 'PROPFIND');
  static const Method PROPPATCH = const Method._(29, 'PROPPATCH');
  static const Method REBIND = const Method._(30, 'REBIND');
  static const Method REPORT = const Method._(31, 'REPORT');
  static const Method SEARCH = const Method._(32, 'SEARCH');
  static const Method SHOWMETHOD = const Method._(33, 'SHOWMETHOD');
  static const Method SPACEJUMP = const Method._(34, 'SPACEJUMP');
  static const Method TEXTSEARCH = const Method._(35, 'TEXTSEARCH');
  static const Method TRACE = const Method._(36, 'TRACE');
  static const Method TRACK = const Method._(37, 'TRACK');
  static const Method UNBIND = const Method._(38, 'UNBIND');
  static const Method UNCHECKOUT = const Method._(39, 'UNCHECKOUT');
  static const Method UNLINK = const Method._(40, 'UNLINK');
  static const Method UNLOCK = const Method._(41, 'UNLOCK');
  static const Method UPDATE = const Method._(42, 'UPDATE');
  static const Method UPDATEREDIRECTREF = const Method._(43, 'UPDATEREDIRECTREF');
  static const Method VERSION_CONTROL = const Method._(44, 'VERSION_CONTROL');

  static const List<Method> values = const <Method> [
    GET,
    POST,
    PUT,
    DELETE,
    HEAD,
    ACL,
    BASELINE_CONTROL,
    BIND,
    CHECKIN,
    CHECKOUT,
    CONNECT,
    COPY,
    DEBUG,
    LABEL,
    LINK,
    LOCK,
    MERGE,
    MKACTIVITY,
    MKCALENDAR,
    MKCOL,
    MKREDIRECTREF,
    MKWORKSPACE,
    MOVE,
    OPTIONS,
    ORDERPATCH,
    PATCH,
    PRI,
    PROPFIND,
    PROPPATCH,
    REBIND,
    REPORT,
    SEARCH,
    SHOWMETHOD,
    SPACEJUMP,
    TEXTSEARCH,
    TRACE,
    TRACK,
    UNBIND,
    UNCHECKOUT,
    UNLINK,
    UNLOCK,
    UPDATE,
    UPDATEREDIRECTREF,
    VERSION_CONTROL,
  ];

  static final Map<int, Method> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Method valueOf(int value) => _byValue[value];
  static void $checkItem(Method v) {
    if (v is! Method) $pb.checkItemFailed(v, 'Method');
  }

  const Method._(int v, String n) : super(v, n);
}

