// To parse this JSON data, do
//
//     final agentDetailModel = agentDetailModelFromJson(jsonString);

import 'dart:convert';

AgentDetailModel agentDetailModelFromJson(String str) => AgentDetailModel.fromJson(json.decode(str));

String agentDetailModelToJson(AgentDetailModel data) => json.encode(data.toJson());

class AgentDetailModel {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? developerName;
  final DateTime? releaseDate;
  final List<String>? characterTags;
  final String? displayIcon;
  final String? displayIconSmall;
  final String? bustPortrait;
  final String? fullPortrait;
  final String? fullPortraitV2;
  final String? killfeedPortrait;
  final String? background;
  final List<String>? backgroundGradientColors;
  final String? assetPath;
  final bool? isFullPortraitRightFacing;
  final bool? isPlayableCharacter;
  final bool? isAvailableForTest;
  final bool? isBaseContent;
  final Role? role;
  final RecruitmentData? recruitmentData;
  final List<Ability>? abilities;
  final VoiceLine? voiceLine;

  AgentDetailModel({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.releaseDate,
    this.characterTags,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.recruitmentData,
    this.abilities,
    this.voiceLine,
  });

  AgentDetailModel copyWith({
    String? uuid,
    String? displayName,
    String? description,
    String? developerName,
    DateTime? releaseDate,
    List<String>? characterTags,
    String? displayIcon,
    String? displayIconSmall,
    String? bustPortrait,
    String? fullPortrait,
    String? fullPortraitV2,
    String? killfeedPortrait,
    String? background,
    List<String>? backgroundGradientColors,
    String? assetPath,
    bool? isFullPortraitRightFacing,
    bool? isPlayableCharacter,
    bool? isAvailableForTest,
    bool? isBaseContent,
    Role? role,
    RecruitmentData? recruitmentData,
    List<Ability>? abilities,
    VoiceLine? voiceLine,
  }) =>
      AgentDetailModel(
        uuid: uuid ?? this.uuid,
        displayName: displayName ?? this.displayName,
        description: description ?? this.description,
        developerName: developerName ?? this.developerName,
        releaseDate: releaseDate ?? this.releaseDate,
        characterTags: characterTags ?? this.characterTags,
        displayIcon: displayIcon ?? this.displayIcon,
        displayIconSmall: displayIconSmall ?? this.displayIconSmall,
        bustPortrait: bustPortrait ?? this.bustPortrait,
        fullPortrait: fullPortrait ?? this.fullPortrait,
        fullPortraitV2: fullPortraitV2 ?? this.fullPortraitV2,
        killfeedPortrait: killfeedPortrait ?? this.killfeedPortrait,
        background: background ?? this.background,
        backgroundGradientColors: backgroundGradientColors ?? this.backgroundGradientColors,
        assetPath: assetPath ?? this.assetPath,
        isFullPortraitRightFacing: isFullPortraitRightFacing ?? this.isFullPortraitRightFacing,
        isPlayableCharacter: isPlayableCharacter ?? this.isPlayableCharacter,
        isAvailableForTest: isAvailableForTest ?? this.isAvailableForTest,
        isBaseContent: isBaseContent ?? this.isBaseContent,
        role: role ?? this.role,
        recruitmentData: recruitmentData ?? this.recruitmentData,
        abilities: abilities ?? this.abilities,
        voiceLine: voiceLine ?? this.voiceLine,
      );

  factory AgentDetailModel.fromJson(Map<String, dynamic> json) {
    AgentDetailModel agentDetailModel = AgentDetailModel(
      uuid: json["uuid"],
      displayName: json["displayName"],
      description: json["description"],
      developerName: json["developerName"],
      releaseDate: json["releaseDate"] == null ? null : DateTime.parse(json["releaseDate"]),
      characterTags: json["characterTags"] == null ? [] : List<String>.from(json["characterTags"]!.map((x) => x)),
      displayIcon: json["displayIcon"],
      displayIconSmall: json["displayIconSmall"],
      bustPortrait: json["bustPortrait"],
      fullPortrait: json["fullPortrait"],
      fullPortraitV2: json["fullPortraitV2"],
      killfeedPortrait: json["killfeedPortrait"],
      background: json["background"],
      backgroundGradientColors: json["backgroundGradientColors"] == null ? [] : List<String>.from(json["backgroundGradientColors"]!.map((x) => x)),
      assetPath: json["assetPath"],
      isFullPortraitRightFacing: json["isFullPortraitRightFacing"],
      isPlayableCharacter: json["isPlayableCharacter"],
      isAvailableForTest: json["isAvailableForTest"],
      isBaseContent: json["isBaseContent"],
      role: json["role"] == null ? null : Role.fromJson(json["role"]),
      recruitmentData: json["recruitmentData"] == null ? null : RecruitmentData.fromJson(json["recruitmentData"]),
      abilities: json["abilities"] == null ? [] : List<Ability>.from(json["abilities"]!.map((x) => Ability.fromJson(x))),
      voiceLine: json["voiceLine"] == null ? null : VoiceLine.fromJson(json["voiceLine"]),
    );

    agentDetailModel.backgroundGradientColors?.removeAt(1);
    agentDetailModel.backgroundGradientColors?.removeAt(2);

    return agentDetailModel;
  }

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "developerName": developerName,
        "releaseDate": releaseDate?.toIso8601String(),
        "characterTags": characterTags == null ? [] : List<dynamic>.from(characterTags!.map((x) => x)),
        "displayIcon": displayIcon,
        "displayIconSmall": displayIconSmall,
        "bustPortrait": bustPortrait,
        "fullPortrait": fullPortrait,
        "fullPortraitV2": fullPortraitV2,
        "killfeedPortrait": killfeedPortrait,
        "background": background,
        "backgroundGradientColors": backgroundGradientColors == null ? [] : List<dynamic>.from(backgroundGradientColors!.map((x) => x)),
        "assetPath": assetPath,
        "isFullPortraitRightFacing": isFullPortraitRightFacing,
        "isPlayableCharacter": isPlayableCharacter,
        "isAvailableForTest": isAvailableForTest,
        "isBaseContent": isBaseContent,
        "role": role?.toJson(),
        "recruitmentData": recruitmentData?.toJson(),
        "abilities": abilities == null ? [] : List<dynamic>.from(abilities!.map((x) => x.toJson())),
        "voiceLine": voiceLine?.toJson(),
      };
}

class Ability {
  final String? slot;
  final String? displayName;
  final String? description;
  final String? displayIcon;

  Ability({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  Ability copyWith({
    String? slot,
    String? displayName,
    String? description,
    String? displayIcon,
  }) =>
      Ability(
        slot: slot ?? this.slot,
        displayName: displayName ?? this.displayName,
        description: description ?? this.description,
        displayIcon: displayIcon ?? this.displayIcon,
      );

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        slot: json["slot"],
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
      };
}

class RecruitmentData {
  final String? counterId;
  final String? milestoneId;
  final int? milestoneThreshold;
  final bool? useLevelVpCostOverride;
  final int? levelVpCostOverride;
  final DateTime? startDate;
  final DateTime? endDate;

  RecruitmentData({
    this.counterId,
    this.milestoneId,
    this.milestoneThreshold,
    this.useLevelVpCostOverride,
    this.levelVpCostOverride,
    this.startDate,
    this.endDate,
  });

  RecruitmentData copyWith({
    String? counterId,
    String? milestoneId,
    int? milestoneThreshold,
    bool? useLevelVpCostOverride,
    int? levelVpCostOverride,
    DateTime? startDate,
    DateTime? endDate,
  }) =>
      RecruitmentData(
        counterId: counterId ?? this.counterId,
        milestoneId: milestoneId ?? this.milestoneId,
        milestoneThreshold: milestoneThreshold ?? this.milestoneThreshold,
        useLevelVpCostOverride: useLevelVpCostOverride ?? this.useLevelVpCostOverride,
        levelVpCostOverride: levelVpCostOverride ?? this.levelVpCostOverride,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );

  factory RecruitmentData.fromJson(Map<String, dynamic> json) => RecruitmentData(
        counterId: json["counterId"],
        milestoneId: json["milestoneId"],
        milestoneThreshold: json["milestoneThreshold"],
        useLevelVpCostOverride: json["useLevelVpCostOverride"],
        levelVpCostOverride: json["levelVpCostOverride"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
      );

  Map<String, dynamic> toJson() => {
        "counterId": counterId,
        "milestoneId": milestoneId,
        "milestoneThreshold": milestoneThreshold,
        "useLevelVpCostOverride": useLevelVpCostOverride,
        "levelVpCostOverride": levelVpCostOverride,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
      };
}

class Role {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? displayIcon;
  final String? assetPath;

  Role({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  });

  Role copyWith({
    String? uuid,
    String? displayName,
    String? description,
    String? displayIcon,
    String? assetPath,
  }) =>
      Role(
        uuid: uuid ?? this.uuid,
        displayName: displayName ?? this.displayName,
        description: description ?? this.description,
        displayIcon: displayIcon ?? this.displayIcon,
        assetPath: assetPath ?? this.assetPath,
      );

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        uuid: json["uuid"],
        displayName: json["displayName"],
        description: json["description"],
        displayIcon: json["displayIcon"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "description": description,
        "displayIcon": displayIcon,
        "assetPath": assetPath,
      };
}

class VoiceLine {
  final double? minDuration;
  final int? maxDuration;
  final List<MediaList>? mediaList;

  VoiceLine({
    this.minDuration,
    this.maxDuration,
    this.mediaList,
  });

  VoiceLine copyWith({
    double? minDuration,
    int? maxDuration,
    List<MediaList>? mediaList,
  }) =>
      VoiceLine(
        minDuration: minDuration ?? this.minDuration,
        maxDuration: maxDuration ?? this.maxDuration,
        mediaList: mediaList ?? this.mediaList,
      );

  factory VoiceLine.fromJson(Map<String, dynamic> json) => VoiceLine(
        minDuration: json["minDuration"]?.toDouble(),
        maxDuration: json["maxDuration"],
        mediaList: json["mediaList"] == null ? [] : List<MediaList>.from(json["mediaList"]!.map((x) => MediaList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "minDuration": minDuration,
        "maxDuration": maxDuration,
        "mediaList": mediaList == null ? [] : List<dynamic>.from(mediaList!.map((x) => x.toJson())),
      };
}

class MediaList {
  final int? id;
  final String? wwise;
  final String? wave;

  MediaList({
    this.id,
    this.wwise,
    this.wave,
  });

  MediaList copyWith({
    int? id,
    String? wwise,
    String? wave,
  }) =>
      MediaList(
        id: id ?? this.id,
        wwise: wwise ?? this.wwise,
        wave: wave ?? this.wave,
      );

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
