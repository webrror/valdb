// To parse this JSON data, do
//
//     final agent = agentFromJson(jsonString);

import 'dart:convert';

Agent agentFromJson(String str) => Agent.fromJson(json.decode(str));

String agentToJson(Agent data) => json.encode(data.toJson());

class Agent {
    Agent({
        required this.status,
        required this.data,
    });

    int status;
    List<Datum> data;

    factory Agent.fromJson(Map<String, dynamic> json) => Agent(
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
        required this.description,
        required this.developerName,
        this.characterTags,
        required this.displayIcon,
        required this.displayIconSmall,
        required this.bustPortrait,
        required this.fullPortrait,
        required this.fullPortraitV2,
        required this.killfeedPortrait,
        required this.background,
        required this.backgroundGradientColors,
        required this.assetPath,
        required this.isFullPortraitRightFacing,
        required this.isPlayableCharacter,
        required this.isAvailableForTest,
        required this.isBaseContent,
        required this.role,
        required this.abilities,
        required this.voiceLine,
    });

    String uuid;
    String displayName;
    String description;
    String developerName;
    List<String>? characterTags;
    String displayIcon;
    String displayIconSmall;
    String bustPortrait;
    String fullPortrait;
    String fullPortraitV2;
    String killfeedPortrait;
    String background;
    List<String> backgroundGradientColors;
    String assetPath;
    bool isFullPortraitRightFacing;
    bool isPlayableCharacter;
    bool isAvailableForTest;
    bool isBaseContent;
    Role role;
    List<Ability> abilities;
    VoiceLine voiceLine;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        developerName: json["developerName"],
        characterTags: json["characterTags"] == null ? null : List<String>.from(json["characterTags"].map((x) => x)),
        displayIcon: json["displayIcon"],
        displayIconSmall: json["displayIconSmall"],
        bustPortrait: json["bustPortrait"],
        fullPortrait: json["fullPortrait"],
        fullPortraitV2: json["fullPortraitV2"],
        killfeedPortrait: json["killfeedPortrait"],
        background: json["background"],
        backgroundGradientColors: List<String>.from(json["backgroundGradientColors"].map((x) => x)),
        assetPath: json["assetPath"],
        isFullPortraitRightFacing: json["isFullPortraitRightFacing"],
        isPlayableCharacter: json["isPlayableCharacter"],
        isAvailableForTest: json["isAvailableForTest"],
        isBaseContent: json["isBaseContent"],
        role: Role.fromJson(json["role"]),
        abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
        voiceLine: VoiceLine.fromJson(json["voiceLine"]),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "developerName": developerName,
        "characterTags": characterTags == null ? null : List<dynamic>.from(characterTags!.map((x) => x)),
        "displayIcon": displayIcon,
        "displayIconSmall": displayIconSmall,
        "bustPortrait": bustPortrait,
        "fullPortrait": fullPortrait,
        "fullPortraitV2": fullPortraitV2,
        "killfeedPortrait": killfeedPortrait,
        "background": background,
        "backgroundGradientColors": List<dynamic>.from(backgroundGradientColors.map((x) => x)),
        "assetPath": assetPath,
        "isFullPortraitRightFacing": isFullPortraitRightFacing,
        "isPlayableCharacter": isPlayableCharacter,
        "isAvailableForTest": isAvailableForTest,
        "isBaseContent": isBaseContent,
        "role": role.toJson(),
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "voiceLine": voiceLine.toJson(),
    };
}

class Ability {
    Ability({
        required this.slot,
        required this.displayName,
        required this.description,
        this.displayIcon,
    });

    Slot slot;
    String displayName;
    String description;
    String? displayIcon;

    factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        slot: slotValues.map[json["slot"]]!,
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"] == null ? null : json["displayIcon"],
    );

    Map<String, dynamic> toJson() => {
        "slot": slotValues.reverse[slot],
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon == null ? null : displayIcon,
    };
}

enum Slot { ABILITY1, ABILITY2, GRENADE, ULTIMATE, PASSIVE }

final slotValues = EnumValues({
    "Ability1": Slot.ABILITY1,
    "Ability2": Slot.ABILITY2,
    "Grenade": Slot.GRENADE,
    "Passive": Slot.PASSIVE,
    "Ultimate": Slot.ULTIMATE
});

class Role {
    Role({
        required this.uuid,
        required this.displayName,
        required this.description,
        required this.displayIcon,
        required this.assetPath,
    });

    String uuid;
    DisplayName displayName;
    String description;
    String displayIcon;
    String assetPath;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        uuid: json["uuid"],
        displayName: displayNameValues.map[json["displayName"]]!,
        description: json["description"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayNameValues.reverse[displayName],
        "description": description,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
    };
}

enum DisplayName { INITIATOR, DUELIST, SENTINEL, CONTROLLER }

final displayNameValues = EnumValues({
    "Controller": DisplayName.CONTROLLER,
    "Duelist": DisplayName.DUELIST,
    "Initiator": DisplayName.INITIATOR,
    "Sentinel": DisplayName.SENTINEL
});

class VoiceLine {
    VoiceLine({
        required this.minDuration,
        required this.maxDuration,
        required this.mediaList,
    });

    double minDuration;
    double maxDuration;
    List<MediaList> mediaList;

    factory VoiceLine.fromJson(Map<String, dynamic> json) => VoiceLine(
        minDuration: json["minDuration"].toDouble(),
        maxDuration: json["maxDuration"].toDouble(),
        mediaList: List<MediaList>.from(json["mediaList"].map((x) => MediaList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "minDuration": minDuration,
        "maxDuration": maxDuration,
        "mediaList": List<dynamic>.from(mediaList.map((x) => x.toJson())),
    };
}

class MediaList {
    MediaList({
        required this.id,
        required this.wwise,
        required this.wave,
    });

    int id;
    String wwise;
    String wave;

    factory MediaList.fromJson(Map<String, dynamic> json) => MediaList(
        id: json["id"],
        wwise: json["wwise"],
        wave: json["wave"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "wwise": wwise,
        "wave": wave,
    };
}

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
