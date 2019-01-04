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
import 'info.dart';

import '../http_service.dart';
import 'organizations.dart';

class LoginScreen extends StatefulWidget {
  final CFHttpService _cfHttpService;

  LoginScreen(this._cfHttpService);

  @override
  _LoginScreenState createState() => _LoginScreenState(_cfHttpService);
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  TextEditingController _apiUrlFilter;
  String _email = "";
  String _password = "";
  String _apiUrl = "api.run.pivotal.io";
  final CFHttpService _cfHttpService;

  _LoginScreenState(this._cfHttpService) {
    _apiUrlFilter = new TextEditingController(
        text: _cfHttpService.apiUrl ?? _apiUrl);

    void _emailListen() {
      if (_emailFilter.text.isEmpty) {
        _email = "";
      } else {
        _email = _emailFilter.text;
      }
    }

    void _passwordListen() {
      if (_passwordFilter.text.isEmpty) {
        _password = "";
      } else {
        _password = _passwordFilter.text;
      }
    }

    void _apiUrlListen() {
      if (_apiUrlFilter.text.isEmpty) {
        _apiUrl = "";
      } else {
        _apiUrl = _apiUrlFilter.text;
      }
    }

    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
    _apiUrlFilter.addListener(_apiUrlListen);
  }

  void _testPressed() async {
    var info = await _cfHttpService.cfInfo(_apiUrl);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Success"),
            content: InfoScreen(info: info,),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text("Close"))
            ],
          );
        });
  }

  void _loginPressed() async {
    await _cfHttpService.initWithUrls(_apiUrl);
    bool success = await _cfHttpService.login(_email, _password);
    if (success) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => OrganizationsScreen(_cfHttpService)));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Login failed"),
              content: new Text("Please check credentials and urls"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: new Text("Close"))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("CloudFoundry mobile client"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              controller: _apiUrlFilter,
              decoration: new InputDecoration(labelText: 'API URL'),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _emailFilter,
              decoration: new InputDecoration(labelText: 'Username'),
            ),
          ),
          new Container(
            child: new TextField(
              controller: _passwordFilter,
              decoration: new InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new RaisedButton(
              child: new Text('Test'),
              onPressed: _testPressed),
          new RaisedButton(
            child: new Text('Login'),
            onPressed: _loginPressed,
          ),
        ],
      ),
    );
  }
}
