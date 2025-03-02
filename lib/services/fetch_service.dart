import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:valdb/models/agents_model.dart';
import 'package:http/http.dart' as http;
import 'package:valdb/models/api_response_model.dart';
import 'package:valdb/models/buddy_model.dart';
import 'package:valdb/models/maps_model.dart';
import 'package:valdb/models/playercards_model.dart';
import 'package:valdb/models/weapons_model.dart';
import 'package:valdb/pages/list_pages/buddies_page.dart';
import 'common.dart';

class FetchService extends Common {
  Future<List<AgentDetailModel>> fetchAgents() async {
    try {
      var res = await http.get(Uri.parse("https://valorant-api.com/v1/agents/?isPLayableCharacter=true"), headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      });

      ApiResponse<List<AgentDetailModel>> response = ApiResponse.fromJson(jsonDecode(res.body), (json) => (json as List).map((e) => AgentDetailModel.fromJson(e)).toList());

      if (response.status == 200) {
        return response.data ?? [];
      }
      return [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<PurpleMap> fetchMaps() async {
    var res = await http.get(Uri.parse("https://valorant-api.com/v1/maps"), headers: {'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'});

    var data = jsonDecode(res.body.toString());

    if (res.statusCode == 200) {
      return PurpleMap.fromJson(data);
    } else {
      return PurpleMap.fromJson(data);
    }
  }

  Future<Weapon> fetchWeapons() async {
    var res = await http.get(Uri.parse("https://valorant-api.com/v1/weapons"), headers: {'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'});

    var data = jsonDecode(res.body.toString());

    if (res.statusCode == 200) {
      return Weapon.fromJson(data);
    } else {
      return Weapon.fromJson(data);
    }
  }

  Future<Buddy> fetchBuddies() async {
    var res = await http.get(Uri.parse("https://valorant-api.com/v1/buddies"), headers: {'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'});

    var data = jsonDecode(res.body.toString());

    if (res.statusCode == 200) {
      return Buddy.fromJson(data);
    } else {
      return Buddy.fromJson(data);
    }
  }

  Future<PlayerCard> fetchPlayerCards() async {
    var res = await http.get(Uri.parse("https://valorant-api.com/v1/playercards"), headers: {'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'});

    var data = jsonDecode(res.body.toString());

    if (res.statusCode == 200) {
      return PlayerCard.fromJson(data);
    } else {
      return PlayerCard.fromJson(data);
    }
  }
}
