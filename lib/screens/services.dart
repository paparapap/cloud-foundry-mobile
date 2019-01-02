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

class ServicesScreen extends StatelessWidget {
  final List<dynamic> services;

  ServicesScreen({this.services});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Services',
          style: TextStyle(fontSize: 10),
        ),
        ListView.builder(
          itemBuilder: (context, index) =>
              ServiceItem(service: services[index]),
          itemCount: services.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        )
      ],
    );
  }
}

class ServiceItem extends StatelessWidget {
  final Map<String, dynamic> service;

  ServiceItem({this.service});

  @override
  Widget build(BuildContext context) {
    String name = service['name'];
    String serviceId = service['guid'];
    int boundAppCount = service['bound_app_count'];
    return InkWell(
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              name,
              style: TextStyle(color: Colors.blue),
            ),
            padding: EdgeInsets.all(10),
          ),
          Container(
            child: Text(
              'Bound apps: $boundAppCount',
              style: TextStyle(color: Colors.blue),
            ),
            padding: EdgeInsets.all(10),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      onTap: () => _openServiceScreen(serviceId),
    );
  }

  _openServiceScreen(String serviceId) {}
}
