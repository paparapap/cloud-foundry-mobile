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

import 'package:flutter/material.dart';

import '../http_service.dart';
import 'app.dart';
import 'app_healthcheck.dart';
import 'app_stats.dart';
import 'generic.dart';
import 'routes.dart';
import 'services.dart';

class AppSummary extends StatelessWidget {
  AppSummary(this._cfHttpService, {this.appId, this.name});

  final String appId;
  final String name;

  final CFHttpService _cfHttpService;

  @override
  Widget build(BuildContext context) {
    return PageScreen(
      _cfHttpService,
      name: 'App $name',
      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var summary = snapshot.data.data;
              print(summary.toString());

              return _buildAppScreen(summary);
            }

            return Center(child: CircularProgressIndicator());
          },
          future: _cfHttpService.appSummary(appId)),
    );
    return null;
  }

  Widget _buildAppScreen(Map<String, dynamic> summary) {
    String id = summary["guid"];
    String name = summary["name"];
    String state = summary["state"];
    int memory = summary['memory'];
    int instanceCount = summary['instances'];
    DateTime updated = DateTime.parse(summary['package_updated_at']);

    return ListView(
      children: <Widget>[
        AppScreen(
          name: name,
          state: state,
          memory: memory,
          instanceCount: instanceCount,
          updated: updated,
        ),
        state == 'STARTED'
            ? AppStatsScreen(
                _cfHttpService,
                appId: id,
                instanceCount: instanceCount,
              )
            : Container(),
        Divider(
          height: 2.0,
          color: Colors.grey,
        ),
        HealthcheckScreen(routes: summary["routes"]),
        Divider(
          height: 2.0,
          color: Colors.grey,
        ),
        RoutesScreen(
          routes: summary["routes"],
        ),
        Divider(
          height: 2.0,
          color: Colors.grey,
        ),
        ServicesScreen(
          services: summary['services'],
        ),
      ],
      shrinkWrap: true,
    );
  }
}
