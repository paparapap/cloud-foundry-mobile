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

import 'package:duration/duration.dart';
import 'package:flutter/material.dart';

import '../http_service.dart';

class AppStatsScreen extends StatelessWidget {
  String appId;
  int instanceCount;

  final CFHttpService _cfHttpService;

  AppStatsScreen(this._cfHttpService, {this.appId, this.instanceCount});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _cfHttpService.appStats(appId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _statsWidget(snapshot.data.data);
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _statsWidget(Map<String, dynamic> stats) {
    return GridView.count(
      crossAxisCount: 2,
      physics: ScrollPhysics(),
      semanticChildCount: instanceCount,
      children: List.generate(instanceCount, (index) {
        return Container(
          child: _statsElement(stats[index.toString()], index),
          padding: EdgeInsets.all(10),
        );
      }),
      shrinkWrap: true,
    );
  }

  Widget _statsElement(Map<String, dynamic> stat, int index) {
    String cpu = _roundToTwoDecimals(stat['stats']['usage']['cpu']);
    String mem = _parseToMb(stat['stats']['usage']['mem']);
    String disk = _parseToMb(stat['stats']['usage']['disk']);
    String uptime = _parseToDuration(stat['stats']['uptime']);
    String host = stat['stats']['host'];

    String memQuota = _parseToMb(stat['stats']['mem_quota']);
    String diskQuota = _parseToMb(stat['stats']['disk_quota']);

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Instance: $index',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Icon(
              _stateIcon(stat['state']),
              color: _stateIconColor(stat['state']),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        Text('Cpu: $cpu%'),
        Text('Memory: ${mem}MB/${memQuota}MB'),
        Text('Disk: ${disk}MB/${diskQuota}MB'),
        Text('Uptime: $uptime'),
        Text('Host: $host'),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  IconData _stateIcon(String state) {
    switch (state) {
      case 'RUNNING':
        return Icons.check_circle;
      default:
        return Icons.remove_circle_outline;
    }
  }

  Color _stateIconColor(String state) {
    switch (state) {
      case 'RUNNING':
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  String _roundToTwoDecimals(double value) {
    return ((value * 10000).round() / 100).toString();
  }

  String _parseToMb(int mem) {
    return (mem / 1024 / 1024).round().toString();
  }

  String _parseToDuration(int seconds) {
    final duration = Duration(seconds: seconds);
    return printDuration(duration, abbreviated: true);
  }
}
