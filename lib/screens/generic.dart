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
import 'package:cloud_foundry/http_service.dart';
import 'login.dart';

class PageScreen extends StatelessWidget {
  PageScreen(this._cfHttpService, {this.body, this.name});

  String name;
  Widget body;
  CFHttpService _cfHttpService;

  List<MenuItem> menu = [MenuItem(name: "Logout")];

  void _select(MenuItem choice) {
    if (choice.name == "Logout") {
      _cfHttpService.logout();
      while (Navigator.canPop(choice.context)) {
        Navigator.pop(choice.context);
      }
      Navigator.pushReplacement(choice.context,
          MaterialPageRoute(builder: (context) => LoginScreen(_cfHttpService)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: body,
        ),
        appBar: AppBar(
          title: Text(
            name ?? "CloudFoundry mobile client",
          ),
          actions: <Widget>[
            PopupMenuButton<MenuItem>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return menu.map((MenuItem item) {
                  item.context = context;
                  return PopupMenuItem<MenuItem>(
                    value: item,
                    child: Row(
                      children: <Widget>[
                        Text(item.name),
                      ],
                    ),
                  );
                }).toList();
              },
            )
          ],
        ));
  }
}

@immutable
class MenuItem {
  MenuItem({this.name, this.context});

  final String name;
  BuildContext context;
}
