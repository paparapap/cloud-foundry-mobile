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
import 'generic.dart';
import 'organization.dart';

class OrganizationsScreen extends StatelessWidget {
  OrganizationsScreen(this._cfHttpService);

  final CFHttpService _cfHttpService;
  var data;

  @override
  Widget build(BuildContext context) {
    return PageScreen(
      _cfHttpService,
      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              data = snapshot.data.data;
              print(data.toString());
              return ListView.builder(
                itemBuilder: (context, index) =>
                    _buildOrganizationRow(context, index),
                itemCount: data['total_results'],
              );
            }

            return Center(child: CircularProgressIndicator());
          },
          future: _cfHttpService.organizations()),
    );
  }

  Widget _buildOrganizationRow(BuildContext context, int index) {
    String name = data["resources"][index]["entity"]["name"];
    String id = data["resources"][index]["metadata"]["guid"];
    return RaisedButton(
      child: Text(name),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    OrganizationScreen(_cfHttpService, orgId: id, name: name)));
      },
    );
  }
}
