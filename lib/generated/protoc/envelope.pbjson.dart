///
//  Generated code. Do not modify.
//  source: envelope.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

const Envelope$json = const {
  '1': 'Envelope',
  '2': const [
    const {'1': 'origin', '3': 1, '4': 2, '5': 9, '10': 'origin'},
    const {'1': 'eventType', '3': 2, '4': 2, '5': 14, '6': '.events.Envelope.EventType', '10': 'eventType'},
    const {'1': 'timestamp', '3': 6, '4': 1, '5': 3, '10': 'timestamp'},
    const {'1': 'deployment', '3': 13, '4': 1, '5': 9, '10': 'deployment'},
    const {'1': 'job', '3': 14, '4': 1, '5': 9, '10': 'job'},
    const {'1': 'index', '3': 15, '4': 1, '5': 9, '10': 'index'},
    const {'1': 'ip', '3': 16, '4': 1, '5': 9, '10': 'ip'},
    const {'1': 'tags', '3': 17, '4': 3, '5': 11, '6': '.events.Envelope.TagsEntry', '10': 'tags'},
    const {'1': 'httpStartStop', '3': 7, '4': 1, '5': 11, '6': '.events.HttpStartStop', '10': 'httpStartStop'},
    const {'1': 'logMessage', '3': 8, '4': 1, '5': 11, '6': '.events.LogMessage', '10': 'logMessage'},
    const {'1': 'valueMetric', '3': 9, '4': 1, '5': 11, '6': '.events.ValueMetric', '10': 'valueMetric'},
    const {'1': 'counterEvent', '3': 10, '4': 1, '5': 11, '6': '.events.CounterEvent', '10': 'counterEvent'},
    const {'1': 'error', '3': 11, '4': 1, '5': 11, '6': '.events.Error', '10': 'error'},
    const {'1': 'containerMetric', '3': 12, '4': 1, '5': 11, '6': '.events.ContainerMetric', '10': 'containerMetric'},
  ],
  '3': const [Envelope_TagsEntry$json],
  '4': const [Envelope_EventType$json],
};

const Envelope_TagsEntry$json = const {
  '1': 'TagsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': const {'7': true},
};

const Envelope_EventType$json = const {
  '1': 'EventType',
  '2': const [
    const {'1': 'HttpStartStop', '2': 4},
    const {'1': 'LogMessage', '2': 5},
    const {'1': 'ValueMetric', '2': 6},
    const {'1': 'CounterEvent', '2': 7},
    const {'1': 'Error', '2': 8},
    const {'1': 'ContainerMetric', '2': 9},
  ],
};

