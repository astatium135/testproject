import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import 'package:flutter/services.dart' show rootBundle;

import '../models/user.dart';
import '../models/news.dart';

class DemoController{
  User? _user;
  User? get user {
    return _user;
  }
  Future<User?> auth({required String name, required String password}) async {
    final String rawUserlist = await rootBundle.loadString('assets/users.json');
    List<dynamic> json = jsonDecode(rawUserlist);
    List<User> users = json.map((element) => User.fromJson(element)).toList();
    final hash = sha1.convert(utf8.encode(password)).toString();
    print(hash);
    for(var user in users) {
      if(user.name == name && user.password.compareTo(hash)==0) {
        this._user = user;
        return this._user;
      } else print(user.password);
    }
    return null;
  }
  Future<void> logout() async {
    _user = null;
  }
  Future<String?> getRawNews() async {
    final authority = 'www.eveonline.com';
    final path = 'rss/json/news';
    Uri url = Uri.https(authority, path);
    var response = await http.get(url);
    if(response.statusCode == 200){
      return response.body;
    }
  }
  Future<List<News>?> getNews() async {
    final rawString = await getRawNews();
    if(rawString!=null||rawString!.isNotEmpty){
      List<dynamic> json = jsonDecode(rawString);
      final ret = json.map((element) => News.fromJson(element)).toList();
      return ret;
    }
  }
}