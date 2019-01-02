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
import 'package:intl/intl.dart';

class AppScreen extends StatelessWidget {
  AppScreen(
      {this.name, this.state, this.memory, this.instanceCount, this.updated});

  final String name;
  final String state;
  final int memory;
  final int instanceCount;
  final DateTime updated;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                  child: Text(
                    name,
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                    child: Column(
                      children: <Widget>[
                        Text('Memory: ${memory.toString()}'),
                        Text('Instances: ${instanceCount.toString()}')
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )
//                  Text(
//                    state,
//                    style: TextStyle(fontSize: 18.0),
//                  ),
                    ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    DateFormat('yyyy-MM-dd kk:mm:ss').format(updated),
                    style: TextStyle(color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 35.0,
                      color: _stateColor(state),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          height: 2.0,
          color: Colors.grey,
        )
      ],
    );
  }

  Color _stateColor(String state) {
    switch (state) {
      case 'STARTED':
        return Colors.green;
      case 'STOPPED':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}
