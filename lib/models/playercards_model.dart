// To parse this JSON data, do
//
//     final playerCard = playerCardFromJson(jsonString);

import 'dart:convert';

PlayerCard playerCardFromJson(String str) => PlayerCard.fromJson(json.decode(str));

String playerCardToJson(PlayerCard data) => json.encode(data.toJson());

class PlayerCard {
    PlayerCard({
        required this.status,
        required this.data,
    });

    int status;
    List<Datum> data;

    factory PlayerCard.fromJson(Map<String, dynamic> json) => PlayerCard(
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
        this.smallArt,
        this.wideArt,
        this.largeArt,
        this.assetPath,
    });

    String? uuid;
    String? displayName;
    bool? isHiddenIfNotOwned;
    String? themeUuid;
    String? displayIcon;
    String? smallArt;
    String? wideArt;
    String? largeArt;
    String? assetPath;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        isHiddenIfNotOwned: json["isHiddenIfNotOwned"],
        themeUuid: json["themeUuid"] == null ? null : json["themeUuid"],
        displayIcon: json["displayIcon"],
        smallArt: json["smallArt"],
        wideArt: json["wideArt"],
        largeArt: json["largeArt"],
        assetPath: json["assetPath"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "isHiddenIfNotOwned": isHiddenIfNotOwned,
        "themeUuid": themeUuid == null ? null : themeUuid,
        "displayIcon": displayIcon,
        "smallArt": smallArt,
        "wideArt": wideArt,
        "largeArt": largeArt,
        "assetPath": assetPath,
    };
}
