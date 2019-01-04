import 'package:flutter/material.dart';
import '../http_service.dart';

import 'app.dart';
import 'app_healthcheck.dart';
import 'app_stats.dart';
import 'routes.dart';
import 'services.dart';

class AppGlobalScreen extends StatelessWidget {
  AppGlobalScreen(this._cfHttpService, {this.appId, this.name});

  final String appId;
  final String name;

  final CFHttpService _cfHttpService;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var summary = snapshot.data.data;
            print(summary.toString());
            return _buildDefaultTabController(summary, context);
          }
          return Center(child: CircularProgressIndicator());
        },
        future: _cfHttpService.appSummary(appId));
  }

  Widget _buildDefaultTabController(
      Map<String, dynamic> summary, BuildContext context) {
    List<Choice> choices = _buildChoices(summary);

    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('App $name'),
          bottom: TabBar(
            isScrollable: true,
            tabs: choices.map((Choice choice) {
              return Tab(
                text: choice.title,
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: choices.map((Choice choice) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: choice,
            );
          }).toList(),
        ),
      ),
    );
  }

  List<Choice> _buildChoices(Map<String, dynamic> summary) => <Choice>[
        AppChoice("App", summary, _cfHttpService),
        RouteChoice("Routes", summary, _cfHttpService),
        ServiceChoice("Services", summary, _cfHttpService)
      ];
}

abstract class Choice extends StatelessWidget {
  Choice({this.title, this.summary, this.cfHttpService});

  final String title;
  final Map<String, dynamic> summary;
  final CFHttpService cfHttpService;
}

class ServiceChoice extends Choice {
  ServiceChoice(title, summary, cfHttpService)
      : super(title: title, summary: summary, cfHttpService: cfHttpService);

  @override
  Widget build(BuildContext context) {
    return ServicesScreen(
      services: summary['services'],
    );
  }
}

class RouteChoice extends Choice {
  RouteChoice(title, summary, cfHttpService)
      : super(title: title, summary: summary, cfHttpService: cfHttpService);

  @override
  Widget build(BuildContext context) {
    return RoutesScreen(
      routes: summary["routes"],
    );
  }
}

class AppChoice extends Choice {
  AppChoice(title, summary, cfHttpService)
      : super(title: title, summary: summary, cfHttpService: cfHttpService);

  @override
  Widget build(BuildContext context) {
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
                cfHttpService,
                appId: id,
                instanceCount: instanceCount,
              )
            : Container(),
        Divider(
          height: 2.0,
          color: Colors.grey,
        ),
        HealthcheckScreen(routes: summary["routes"]),
      ],
    );
  }
}
