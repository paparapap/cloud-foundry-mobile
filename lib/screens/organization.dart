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
import 'space.dart';

class OrganizationScreen extends StatelessWidget {
  OrganizationScreen(this._cfHttpService, {this.orgId, this.name});

  final CFHttpService _cfHttpService;
  String orgId;
  String name;

  var spaces;

  @override
  Widget build(BuildContext context) {
    return PageScreen(
      _cfHttpService,
      name: 'Organization $name',
      body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              spaces = snapshot.data.data;
              print(spaces.toString());
              return ListView.builder(
                itemBuilder: (context, index) => _buildSpaceRow(context, index),
                itemCount: spaces['total_results'],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
          future: _cfHttpService.spaces(orgId)),
    );
  }

  Widget _buildSpaceRow(context, index) {
    String id = spaces["resources"][index]["metadata"]["guid"];
    String name = spaces["resources"][index]["entity"]["name"];
    print("Building for space $name, $id");
    return InkWell(
      child: Container(
        child: Text(name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, style: BorderStyle.solid))),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SpaceScreen(
                  _cfHttpService,
                  id: id,
                  name: name,
                )));
      },
    );
  }
}
