///
//  Generated code. Do not modify.
//  source: http.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

const PeerType$json = const {
  '1': 'PeerType',
  '2': const [
    const {'1': 'Client', '2': 1},
    const {'1': 'Server', '2': 2},
  ],
};

const Method$json = const {
  '1': 'Method',
  '2': const [
    const {'1': 'GET', '2': 1},
    const {'1': 'POST', '2': 2},
    const {'1': 'PUT', '2': 3},
    const {'1': 'DELETE', '2': 4},
    const {'1': 'HEAD', '2': 5},
    const {'1': 'ACL', '2': 6},
    const {'1': 'BASELINE_CONTROL', '2': 7},
    const {'1': 'BIND', '2': 8},
    const {'1': 'CHECKIN', '2': 9},
    const {'1': 'CHECKOUT', '2': 10},
    const {'1': 'CONNECT', '2': 11},
    const {'1': 'COPY', '2': 12},
    const {'1': 'DEBUG', '2': 13},
    const {'1': 'LABEL', '2': 14},
    const {'1': 'LINK', '2': 15},
    const {'1': 'LOCK', '2': 16},
    const {'1': 'MERGE', '2': 17},
    const {'1': 'MKACTIVITY', '2': 18},
    const {'1': 'MKCALENDAR', '2': 19},
    const {'1': 'MKCOL', '2': 20},
    const {'1': 'MKREDIRECTREF', '2': 21},
    const {'1': 'MKWORKSPACE', '2': 22},
    const {'1': 'MOVE', '2': 23},
    const {'1': 'OPTIONS', '2': 24},
    const {'1': 'ORDERPATCH', '2': 25},
    const {'1': 'PATCH', '2': 26},
    const {'1': 'PRI', '2': 27},
    const {'1': 'PROPFIND', '2': 28},
    const {'1': 'PROPPATCH', '2': 29},
    const {'1': 'REBIND', '2': 30},
    const {'1': 'REPORT', '2': 31},
    const {'1': 'SEARCH', '2': 32},
    const {'1': 'SHOWMETHOD', '2': 33},
    const {'1': 'SPACEJUMP', '2': 34},
    const {'1': 'TEXTSEARCH', '2': 35},
    const {'1': 'TRACE', '2': 36},
    const {'1': 'TRACK', '2': 37},
    const {'1': 'UNBIND', '2': 38},
    const {'1': 'UNCHECKOUT', '2': 39},
    const {'1': 'UNLINK', '2': 40},
    const {'1': 'UNLOCK', '2': 41},
    const {'1': 'UPDATE', '2': 42},
    const {'1': 'UPDATEREDIRECTREF', '2': 43},
    const {'1': 'VERSION_CONTROL', '2': 44},
  ],
};

const HttpStartStop$json = const {
  '1': 'HttpStartStop',
  '2': const [
    const {'1': 'startTimestamp', '3': 1, '4': 2, '5': 3, '10': 'startTimestamp'},
    const {'1': 'stopTimestamp', '3': 2, '4': 2, '5': 3, '10': 'stopTimestamp'},
    const {'1': 'requestId', '3': 3, '4': 2, '5': 11, '6': '.events.UUID', '10': 'requestId'},
    const {'1': 'peerType', '3': 4, '4': 2, '5': 14, '6': '.events.PeerType', '10': 'peerType'},
    const {'1': 'method', '3': 5, '4': 2, '5': 14, '6': '.events.Method', '10': 'method'},
    const {'1': 'uri', '3': 6, '4': 2, '5': 9, '10': 'uri'},
    const {'1': 'remoteAddress', '3': 7, '4': 2, '5': 9, '10': 'remoteAddress'},
    const {'1': 'userAgent', '3': 8, '4': 2, '5': 9, '10': 'userAgent'},
    const {'1': 'statusCode', '3': 9, '4': 2, '5': 5, '10': 'statusCode'},
    const {'1': 'contentLength', '3': 10, '4': 2, '5': 3, '10': 'contentLength'},
    const {'1': 'applicationId', '3': 12, '4': 1, '5': 11, '6': '.events.UUID', '10': 'applicationId'},
    const {'1': 'instanceIndex', '3': 13, '4': 1, '5': 5, '10': 'instanceIndex'},
    const {'1': 'instanceId', '3': 14, '4': 1, '5': 9, '10': 'instanceId'},
    const {'1': 'forwarded', '3': 15, '4': 3, '5': 9, '10': 'forwarded'},
  ],
};

