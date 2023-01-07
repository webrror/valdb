// To parse this JSON data, do
//
//     final buddy = buddyFromJson(jsonString);

import 'dart:convert';

Buddy buddyFromJson(String str) => Buddy.fromJson(json.decode(str));

String buddyToJson(Buddy data) => json.encode(data.toJson());

class Buddy {
    Buddy({
        required this.status,
        required this.data,
    });

    int? status;
    List<Datum> data;

    factory Buddy.fromJson(Map<String, dynamic> json) => Buddy(
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
        this.uuid,
        this.displayName,
        this.isHiddenIfNotOwned,
        this.themeUuid,
        this.displayIcon,
        this.assetPath,
        this.levels,
    });

    String? uuid;
    String? displayName;
    bool? isHiddenIfNotOwned;
    String? themeUuid;
    String? displayIcon;
    String? assetPath;
    List<Level>? levels;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        isHiddenIfNotOwned: json["isHiddenIfNotOwned"],
        themeUuid: json["themeUuid"] == null ? null : json["themeUuid"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
        levels: List<Level>.from(json["levels"].map((x) => Level.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "isHiddenIfNotOwned": isHiddenIfNotOwned,
        "themeUuid": themeUuid == null ? null : themeUuid,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
        "levels": List<dynamic>.from(levels!.map((x) => x.toJson())),
    };
}

class Level {
    Level({
        this.uuid,
        this.charmLevel,
        this.displayName,
        this.displayIcon,
        this.assetPath,
    });

    String? uuid;
    int? charmLevel;
    String? displayName;
    String? displayIcon;
    String? assetPath;

    factory Level.fromJson(Map<String, dynamic> json) => Level(
        uuid: json["uuid"],
        charmLevel: json["charmLevel"],
        displayName: json["displayName"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "charmLevel": charmLevel,
        "displayName": displayName,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
    };
}
