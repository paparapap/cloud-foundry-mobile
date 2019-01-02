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
import 'package:url_launcher/url_launcher.dart';

class RoutesScreen extends StatelessWidget {
  final List<dynamic> routes;

  RoutesScreen({this.routes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Routes',
          style: TextStyle(fontSize: 10),
        ),
        ListView.builder(
            itemBuilder: (context, index) => _buildRouteView(context, index),
            itemCount: routes.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics()),
      ],
    );
  }

  Widget _buildRouteView(BuildContext context, int index) {
    Map<String, dynamic> route = routes[index];
    String url = "https://${route['host']}.${route['domain']['name']}";
    return Row(
      children: <Widget>[
        Container(
          child: Text(
            url,
            style: TextStyle(color: Colors.blue),
          ),
          padding: EdgeInsets.all(10),
        ),
        InkWell(
          child: Icon(
            Icons.open_in_browser,
            size: 35.0,
          ),
          onTap: () => _launchURL(url),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }
}
