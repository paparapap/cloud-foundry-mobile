/*
 * Copyright 2019 LumiLuma
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';

import 'config.dart';
import 'http_service.dart';
import 'screens/login.dart';
import 'screens/organizations.dart';

final SentryClient _sentry = new SentryClient(dsn: Config.sentryDns);

Future<Null> main() async {
  // This captures errors reported by the Flutter framework.
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  CFHttpService _cfHttpService = CFHttpService();
  Widget _defaultHome;
  bool _authorized = await _cfHttpService.isAuthorized();

  if (_authorized) {
    await _cfHttpService.init();
    _defaultHome = OrganizationsScreen(_cfHttpService);
  } else {
    _defaultHome = LoginScreen(_cfHttpService);
  }
  runZoned<Future<Null>>(() async {
    runApp(CloudFoundryApp(_defaultHome));
  }, onError: (error, stackTrace) async {
    await _reportError(error, stackTrace);
  });
}

class CloudFoundryApp extends StatelessWidget {
  CloudFoundryApp(this._defaultHome);

  Widget _defaultHome;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud foundry mobile app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _defaultHome,
    );
  }
}

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  print('Caught error: $error');

  if (isInDebugMode) {
    print(stackTrace);
    print('In dev mode. Not sending report to Sentry.io.');
    return;
  }

  print('Reporting to Sentry.io...');

  final SentryResponse response = await _sentry.captureException(
    exception: error,
    stackTrace: stackTrace,
  );

  if (response.isSuccessful) {
    print('Success! Event ID: ${response.eventId}');
  } else {
    print('Failed to report to Sentry.io: ${response.error}');
  }
}
