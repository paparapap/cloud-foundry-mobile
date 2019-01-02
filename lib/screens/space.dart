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
import 'app-summary.dart';
import 'app.dart';
import 'generic.dart';

class SpaceScreen extends StatelessWidget {
  SpaceScreen(this._cfHttpService, {this.id, this.name});

  String id;
  String name;

  final CFHttpService _cfHttpService;

  var apps;

  @override
  Widget build(BuildContext context) {
    return PageScreen(
      _cfHttpService,
      name: 'Space $name',
      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              apps = snapshot.data.data;
              print(apps.toString());

              return ListView.builder(
                itemBuilder: (context, index) => _buildAppRow(context, index),
                itemCount: apps['total_results'],
              );
            }

            return Center(child: CircularProgressIndicator());
          },
          future: _cfHttpService.space(id)),
    );
  }

  Widget _buildAppRow(BuildContext context, int index) {
    String id = apps["resources"][index]["metadata"]["guid"];
    Map<String, dynamic> entity = apps["resources"][index]["entity"];
    String name = entity["name"];
    String state = entity["state"];
    int memory = entity['memory'];
    int instanceCount = entity['instances'];
    DateTime updated;
    try {
      updated = DateTime.parse(entity['package_updated_at']);
    } on Exception catch (e) {}

    return InkWell(
      child: AppScreen(
          name: name,
          state: state,
          memory: memory,
          instanceCount: instanceCount,
          updated: updated),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    AppSummary(_cfHttpService, name: name, appId: id)));
      },
    );
  }

  TableRow _tableRow(String name, String value) {
    return TableRow(children: [
      TableCell(
        child: Text(name),
      ),
      TableCell(
        child: Text(value),
      )
    ]);
  }
}
