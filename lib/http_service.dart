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

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as ioClient;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CFHttpService {
  final Dio dio = Dio();
  final FlutterSecureStorage storage = FlutterSecureStorage();
  var client = ioClient.IOClient();

  static const ACCESS_TOKEN_KEY = 'cf_access_token';
  static const REFRESH_TOKEN_KEY = 'cf_refresh_token';
  static const AUTH_URL_KEY = 'cf_auth_url';
  static const API_URL_KEY = 'cf_api_url';

  String apiUrl;
  String authUrl;

  Future<void> initWithUrls(String apiUrl, String authUrl) async {
    await storage.write(key: API_URL_KEY, value: apiUrl);
    await storage.write(key: AUTH_URL_KEY, value: authUrl);
    init();
  }

  Future<void> init() async {
    apiUrl = await storage.read(key: API_URL_KEY);
    authUrl = await storage.read(key: AUTH_URL_KEY);

    dio.options.baseUrl = "https://$apiUrl";
    dio.options.responseType = ResponseType.JSON;
  }

  Future<bool> isAuthorized() async {
    if (await storage.read(key: REFRESH_TOKEN_KEY) == null) {
      return false;
    }
    await _refresh();
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer ${await storage.read(key: ACCESS_TOKEN_KEY)}"
    };
    Uri uri = Uri.https(authUrl, "/userinfo");

    http.Response res = await client.get(uri, headers: headers);
    return res.statusCode == 200;
  }

  organizations() async {
    return executeAuthorized("/v2/organizations");
  }

  organization(String orgId) async {
    return executeAuthorized("/v2/organizations/$orgId");
  }

  spaces(String orgId) async {
    return executeAuthorized("/v2/organizations/$orgId/spaces");
  }

  space(String spaceId) {
    return executeAuthorized("/v2/spaces/$spaceId/apps");
  }

  appSummary(String appId) {
    return executeAuthorized("/v2/apps/$appId/summary");
  }

  appStats(String appId) {
    return executeAuthorized("/v2/apps/$appId/stats");
  }

  healthCheck(String baseUrl) async {
    String url = '$baseUrl/actuator/health';
    Response res = await dio.get(url);
    return res;
  }

  executeAuthorized(String url) async {
    String accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    Options options =
        Options(headers: {"Authorization": "Bearer $accessToken"});
    print("Executing GET: $url");
    Response res;
    try {
      res = await dio.get(url, options: options);
    } on DioError catch (e) {
      switch (e.response.statusCode) {
        case 401:
          print("Refreshing access token");
          if (await _refresh()) {
            return executeAuthorized(res.request.toString());
          } else {
            throw Exception("Unable to refresh token. Please relogin");
          }
          break;
        default:
          print("Error: ${e.message}");
      }
    }
    return res;
  }

  Future<bool> login(String username, String password) async {
    if (authUrl == null) {
      await init();
    }
    Map form = {
      "client_id": "cf",
      "client_secret": "",
      "grant_type": "password",
      "response_type": "token",
      "username": username,
      "password": password
    };

    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Basic Y2Y6"
    };
    Uri uri = Uri.https(await storage.read(key: AUTH_URL_KEY), "/oauth/token");

    http.Response res = await client.post(uri, headers: headers, body: form);
    if (res.statusCode != 200) {
      print("Non HTTP 200 received: ${res.statusCode}");
      return false;
    }
    Map body = jsonDecode(res.body);
    storage.write(key: ACCESS_TOKEN_KEY, value: body["access_token"]);
    storage.write(key: REFRESH_TOKEN_KEY, value: body["refresh_token"]);
    print("$username logged in successfully");
    return true;
  }

  Future<bool> _refresh() async {
    String refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    Map form = {
      "client_id": "cf",
      "client_secret": "",
      "grant_type": "refresh_token",
      "refresh_token": refreshToken,
      "response_type": "token",
    };

    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Basic Y2Y6"
    };
    if (authUrl == null) {
      await init();
    }
    Uri uri = Uri.https(authUrl, "/oauth/token");

    http.Response res = await client.post(uri, headers: headers, body: form);
    if (res.statusCode == 200) {
      Map body = jsonDecode(res.body);
      await storage.write(key: ACCESS_TOKEN_KEY, value: body["access_token"]);
      await storage.write(key: REFRESH_TOKEN_KEY, value: body["refresh_token"]);
      return true;
    } else {
      await logout();
      return false;
    }
  }

  Future<void> logout() async {
    await storage.delete(key: ACCESS_TOKEN_KEY);
    await storage.delete(key: REFRESH_TOKEN_KEY);
  }
}
