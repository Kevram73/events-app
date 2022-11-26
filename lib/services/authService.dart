import 'dart:convert';

import 'package:evant/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class AuthService extends ChangeNotifier {
  var headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  late Map<String, dynamic> result;

  login(String phone, String password) async {
    Map<String, String> loginData = {"phone": phone, "password": password};

    var response = await http.post(Uri.parse(Urls.login),
        headers: headers, body: loginData);
    var responseData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      User user = User.fromJson(responseData['user']);

      result = {"user": user, "status": true, "token": responseData['token']};
    } else {
      result = {"success": false, "error": responseData['errors']};
    }

    return result;
  }

  register(String email, String username, String phone, String password) async {
    Map<String, String> registerData = {
      "username": username,
      "email": email,
      "phone": phone,
      "password": password
    };

    var response = await http.post(Uri.parse(Urls.register),
        headers: headers, body: registerData);
    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      result = {"success": true, "message": "Utilisateur créé avec succès"};
    } else {
      result = {"success": false, "error": responseData['errors']};
    }

    return result;
  }

  logout(String id, String token) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.clear();
  }

  userInfo(String id, String token) async {
    var response = await http.post(Uri.parse(Urls.userInfo + id), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    });

    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      result = {"success": true, "user": User.fromJson(responseData['user'])};
    } else {
      result = {"success": false, "error": responseData['errors']};
    }

    return result;
  }

  resetP(String newPassword, String oldPassword, String token) async {
    var response = await http.post(Uri.parse(Urls.resetP), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    }, body: {
      "new_password": newPassword,
      "old_password": oldPassword
    });

    if (response.statusCode == 200) {
      result = {"success": true};
    } else {
      result = {"success": false};
    }

    return result;
  }

  forgotP(String email) async {
    var response =
        await http.post(Uri.parse(Urls.forgotP), headers: headers, body: {
      "email": email,
    });

    if (response.statusCode == 200) {
      result = {"success": true};
    } else {
      result = {"success": false};
    }

    return result;
  }
}
