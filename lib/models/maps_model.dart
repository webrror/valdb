// To parse this JSON data, do
//
//     final purpleMap = purpleMapFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PurpleMap purpleMapFromJson(String str) => PurpleMap.fromJson(json.decode(str));

String purpleMapToJson(PurpleMap data) => json.encode(data.toJson());

class PurpleMap {
    PurpleMap({
        required this.status,
        required this.data,
    });

    int status;
    List<Datum> data;

    factory PurpleMap.fromJson(Map<String, dynamic> json) => PurpleMap(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.uuid,
        required this.displayName,
        required this.coordinates,
        this.displayIcon,
        required this.listViewIcon,
        required this.splash,
        required this.assetPath,
        required this.mapUrl,
        required this.xMultiplier,
        required this.yMultiplier,
        required this.xScalarToAdd,
        required this.yScalarToAdd,
        this.callouts,
    });

    String uuid;
    String displayName;
    String coordinates;
    String? displayIcon;
    String listViewIcon;
    String splash;
    String assetPath;
    String mapUrl;
    double xMultiplier;
    double yMultiplier;
    double xScalarToAdd;
    double yScalarToAdd;
    List<Callout>? callouts;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        coordinates: json["coordinates"],
        displayIcon: json["displayIcon"] == null ? null : json["displayIcon"],
        listViewIcon: json["listViewIcon"],
        splash: json["splash"],
        assetPath: json["assetPath"],
        mapUrl: json["mapUrl"],
        xMultiplier: json["xMultiplier"].toDouble(),
        yMultiplier: json["yMultiplier"].toDouble(),
        xScalarToAdd: json["xScalarToAdd"].toDouble(),
        yScalarToAdd: json["yScalarToAdd"].toDouble(),
        callouts: json["callouts"] == null ? null : List<Callout>.from(json["callouts"].map((x) => Callout.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "coordinates": coordinates,
        "displayIcon": displayIcon == null ? null : displayIcon,
        "listViewIcon": listViewIcon,
        "splash": splash,
        "assetPath": assetPath,
        "mapUrl": mapUrl,
        "xMultiplier": xMultiplier,
        "yMultiplier": yMultiplier,
        "xScalarToAdd": xScalarToAdd,
        "yScalarToAdd": yScalarToAdd,
        "callouts": callouts == null ? null : List<dynamic>.from(callouts!.map((x) => x.toJson())),
    };
}

class Callout {
    Callout({
        required this.regionName,
        required this.superRegionName,
        required this.location,
    });

    String regionName;
    SuperRegionName? superRegionName;
    Location location;

    factory Callout.fromJson(Map<String, dynamic> json) => Callout(
        regionName: json["regionName"],
        superRegionName: superRegionNameValues.map[json["superRegionName"]],
        location: Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "regionName": regionName,
        "superRegionName": superRegionNameValues.reverse[superRegionName],
        "location": location.toJson(),
    };
}

class Location {
    Location({
        required this.x,
        required this.y,
    });

    double x;
    double y;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        x: json["x"].toDouble(),
        y: json["y"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
    };
}

enum SuperRegionName { A, ATTACKER_SIDE, B, MID, DEFENDER_SIDE, C }

final superRegionNameValues = EnumValues({
    "A": SuperRegionName.A,
    "Attacker Side": SuperRegionName.ATTACKER_SIDE,
    "B": SuperRegionName.B,
    "C": SuperRegionName.C,
    "Defender Side": SuperRegionName.DEFENDER_SIDE,
    "Mid": SuperRegionName.MID
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
