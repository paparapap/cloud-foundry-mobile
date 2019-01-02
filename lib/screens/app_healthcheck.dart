import 'dart:convert';

import 'package:flutter/material.dart';

import '../http_service.dart';

class HealthcheckScreen extends StatelessWidget {
  List<dynamic> routes;
  String baseUrl;

  JsonEncoder encoder = new JsonEncoder.withIndent("  ");
  JsonDecoder decoder = new JsonDecoder();

  HealthcheckScreen({this.routes}) {
    if (routes.length > 0) {
      Map<String, dynamic> firstRoute = routes[0];
      baseUrl = "https://${firstRoute['host']}.${firstRoute['domain']['name']}";
    }
  }

  CFHttpService _cfHttpService = CFHttpService();

  @override
  Widget build(BuildContext context) {
    if (baseUrl == null) {
      return Container();
    }
    return Column(
      children: <Widget>[
        Text(
          'Health',
          style: TextStyle(fontSize: 10),
        ),
        FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> hc = decoder.convert(snapshot.data.data);
              String json = encoder.convert(hc);
              return getTile(hc['status'], json);
            }
            return getTile('DOWN', "");
          },
          future: _cfHttpService.healthCheck(baseUrl),
        ),
      ],
    );
  }

  Widget getTile(String status, String json) {
    return ExpansionTile(
      title: Row(
        children: <Widget>[
          Text('Status:'),
          Text('$status',
              style: TextStyle(color: _determineStatusColor(status)))
        ],
      ),
      children: <Widget>[
        SingleChildScrollView(
          child: Text(
            json,
            style: new TextStyle(fontSize: 12.0),
          ),
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(10),
        )
      ],
    );
  }

  Color _determineStatusColor(String status) {
    switch (status) {
      case 'UP':
        return Colors.green;
      default:
        return Colors.red;
    }
  }
}
