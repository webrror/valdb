// To parse this JSON data, do
//
//     final weapon = weaponFromJson(jsonString);

import 'dart:convert';

Weapon weaponFromJson(String str) => Weapon.fromJson(json.decode(str));

String weaponToJson(Weapon data) => json.encode(data.toJson());

class Weapon {
    Weapon({
        required this.status,
        required this.data,
    });

    int status;
    List<Datum> data;

    factory Weapon.fromJson(Map<String, dynamic> json) => Weapon(
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
        this.category,
        this.defaultSkinUuid,
        this.displayIcon,
        this.killStreamIcon,
        this.assetPath,
        this.weaponStats,
        this.shopData,
        this.skins,
    });

    String? uuid;
    String? displayName;
    String? category;
    String? defaultSkinUuid;
    String? displayIcon;
    String? killStreamIcon;
    String? assetPath;
    WeaponStats? weaponStats;
    ShopData? shopData;
    List<Skin>? skins;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        category: json["category"],
        defaultSkinUuid: json["defaultSkinUuid"],
        displayIcon: json["displayIcon"],
        killStreamIcon: json["killStreamIcon"],
        assetPath: json["assetPath"],
        weaponStats: json["weaponStats"] == null ? null : WeaponStats.fromJson(json["weaponStats"]),
        shopData: json["shopData"] == null ? null : ShopData.fromJson(json["shopData"]),
        skins: List<Skin>.from(json["skins"].map((x) => Skin.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "category": category,
        "defaultSkinUuid": defaultSkinUuid,
        "displayIcon": displayIcon,
        "killStreamIcon": killStreamIcon,
        "assetPath": assetPath,
        "weaponStats": weaponStats == null ? null : weaponStats!.toJson(),
        "shopData": shopData == null ? null : shopData!.toJson(),
        "skins": List<dynamic>.from(skins!.map((x) => x.toJson())),
    };
}

class ShopData {
    ShopData({
        this.cost,
        this.category,
        this.categoryText,
        this.gridPosition,
        this.canBeTrashed,
        this.image,
        this.newImage,
        this.newImage2,
        this.assetPath,
    });

    int? cost;
    String? category;
    String? categoryText;
    GridPosition? gridPosition;
    bool? canBeTrashed;
    dynamic image;
    String? newImage;
    dynamic newImage2;
    String? assetPath;

    factory ShopData.fromJson(Map<String, dynamic> json) => ShopData(
        cost: json["cost"],
        category: json["category"],
        categoryText: json["categoryText"],
        gridPosition: json["gridPosition"] == null ? null : GridPosition.fromJson(json["gridPosition"]),
        canBeTrashed: json["canBeTrashed"],
        image: json["image"],
        newImage: json["newImage"],
        newImage2: json["newImage2"],
        assetPath: json["assetPath"],
    );

    Map<String, dynamic> toJson() => {
        "cost": cost,
        "category": category,
        "categoryText": categoryText,
        "gridPosition": gridPosition == null ? null : gridPosition!.toJson(),
        "canBeTrashed": canBeTrashed,
        "image": image,
        "newImage": newImage,
        "newImage2": newImage2,
        "assetPath": assetPath,
    };
}

class GridPosition {
    GridPosition({
        this.row,
        this.column,
    });

    int? row;
    int? column;

    factory GridPosition.fromJson(Map<String, dynamic> json) => GridPosition(
        row: json["row"],
        column: json["column"],
    );

    Map<String, dynamic> toJson() => {
        "row": row,
        "column": column,
    };
}

class Skin {
    Skin({
        this.uuid,
        this.displayName,
        this.themeUuid,
        this.contentTierUuid,
        this.displayIcon,
        this.wallpaper,
        this.assetPath,
        this.chromas,
        this.levels,
    });

    String? uuid;
    String? displayName;
    String? themeUuid;
    String? contentTierUuid;
    String? displayIcon;
    String? wallpaper;
    String? assetPath;
    List<Chroma>? chromas;
    List<Level>? levels;

    factory Skin.fromJson(Map<String, dynamic> json) => Skin(
        uuid: json["uuid"],
        displayName: json["displayName"],
        themeUuid: json["themeUuid"],
        contentTierUuid: json["contentTierUuid"] == null ? null : json["contentTierUuid"],
        displayIcon: json["displayIcon"] == null ? null : json["displayIcon"],
        wallpaper: json["wallpaper"] == null ? null : json["wallpaper"],
        assetPath: json["assetPath"],
        chromas: List<Chroma>.from(json["chromas"].map((x) => Chroma.fromJson(x))),
        levels: List<Level>.from(json["levels"].map((x) => Level.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "themeUuid": themeUuid,
        "contentTierUuid": contentTierUuid == null ? null : contentTierUuid,
        "displayIcon": displayIcon == null ? null : displayIcon,
        "wallpaper": wallpaper == null ? null : wallpaper,
        "assetPath": assetPath,
        "chromas": List<dynamic>.from(chromas!.map((x) => x.toJson())),
        "levels": List<dynamic>.from(levels!.map((x) => x.toJson())),
    };
}

class Chroma {
    Chroma({
        this.uuid,
        this.displayName,
        this.displayIcon,
        this.fullRender,
        this.swatch,
        this.streamedVideo,
        this.assetPath,
    });

    String? uuid;
    String? displayName;
    String? displayIcon;
    String? fullRender;
    String? swatch;
    String? streamedVideo;
    String? assetPath;

    factory Chroma.fromJson(Map<String, dynamic> json) => Chroma(
        uuid: json["uuid"],
        displayName: json["displayName"],
        displayIcon: json["displayIcon"] == null ? null : json["displayIcon"],
        fullRender: json["fullRender"],
        swatch: json["swatch"] == null ? null : json["swatch"],
        streamedVideo: json["streamedVideo"] == null ? null : json["streamedVideo"],
        assetPath: json["assetPath"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "displayIcon": displayIcon == null ? null : displayIcon,
        "fullRender": fullRender,
        "swatch": swatch == null ? null : swatch,
        "streamedVideo": streamedVideo == null ? null : streamedVideo,
        "assetPath": assetPath,
    };
}

class Level {
    Level({
        this.uuid,
        this.displayName,
        this.levelItem,
        this.displayIcon,
        this.streamedVideo,
        this.assetPath,
    });

    String? uuid;
    String? displayName;
    LevelItem? levelItem;
    String? displayIcon;
    String? streamedVideo;
    String? assetPath;

    factory Level.fromJson(Map<String, dynamic> json) => Level(
        uuid: json["uuid"],
        displayName: json["displayName"],
        levelItem: json["levelItem"] == null ? null : levelItemValues.map[json["levelItem"]],
        displayIcon: json["displayIcon"] == null ? null : json["displayIcon"],
        streamedVideo: json["streamedVideo"] == null ? null : json["streamedVideo"],
        assetPath: json["assetPath"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "levelItem": levelItem == null ? null : levelItemValues.reverse[levelItem],
        "displayIcon": displayIcon == null ? null : displayIcon,
        "streamedVideo": streamedVideo == null ? null : streamedVideo,
        "assetPath": assetPath,
    };
}

enum LevelItem { E_EQUIPPABLE_SKIN_LEVEL_ITEM_HEARTBEAT_AND_MAP_SENSOR, E_EQUIPPABLE_SKIN_LEVEL_ITEM_VFX, E_EQUIPPABLE_SKIN_LEVEL_ITEM_FINISHER, E_EQUIPPABLE_SKIN_LEVEL_ITEM_ANIMATION, E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_EFFECT, E_EQUIPPABLE_SKIN_LEVEL_ITEM_SOUND_EFFECTS, E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_COUNTER, E_EQUIPPABLE_SKIN_LEVEL_ITEM_FISH_ANIMATION, E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_BANNER, E_EQUIPPABLE_SKIN_LEVEL_ITEM_INSPECT_AND_KILL, E_EQUIPPABLE_SKIN_LEVEL_ITEM_TOP_FRAG, E_EQUIPPABLE_SKIN_LEVEL_ITEM_VOICEOVER, E_EQUIPPABLE_SKIN_LEVEL_ITEM_RANDOMIZER }

final levelItemValues = EnumValues({
    "EEquippableSkinLevelItem::Animation": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_ANIMATION,
    "EEquippableSkinLevelItem::Finisher": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_FINISHER,
    "EEquippableSkinLevelItem::FishAnimation": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_FISH_ANIMATION,
    "EEquippableSkinLevelItem::HeartbeatAndMapSensor": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_HEARTBEAT_AND_MAP_SENSOR,
    "EEquippableSkinLevelItem::InspectAndKill": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_INSPECT_AND_KILL,
    "EEquippableSkinLevelItem::KillBanner": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_BANNER,
    "EEquippableSkinLevelItem::KillCounter": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_COUNTER,
    "EEquippableSkinLevelItem::KillEffect": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_EFFECT,
    "EEquippableSkinLevelItem::Randomizer": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_RANDOMIZER,
    "EEquippableSkinLevelItem::SoundEffects": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_SOUND_EFFECTS,
    "EEquippableSkinLevelItem::TopFrag": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_TOP_FRAG,
    "EEquippableSkinLevelItem::VFX": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_VFX,
    "EEquippableSkinLevelItem::Voiceover": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_VOICEOVER
});

class WeaponStats {
    WeaponStats({
        this.fireRate,
        this.magazineSize,
        this.runSpeedMultiplier,
        this.equipTimeSeconds,
        this.reloadTimeSeconds,
        this.firstBulletAccuracy,
        this.shotgunPelletCount,
        this.wallPenetration,
        this.feature,
        this.fireMode,
        this.altFireType,
        this.adsStats,
        this.altShotgunStats,
        this.airBurstStats,
        this.damageRanges,
    });

    double? fireRate;
    int? magazineSize;
    double? runSpeedMultiplier;
    double? equipTimeSeconds;
    double? reloadTimeSeconds;
    double? firstBulletAccuracy;
    int? shotgunPelletCount;
    WallPenetration? wallPenetration;
    String? feature;
    String? fireMode;
    AltFireType? altFireType;
    AdsStats? adsStats;
    AltShotgunStats? altShotgunStats;
    AirBurstStats? airBurstStats;
    List<DamageRange>? damageRanges;

    factory WeaponStats.fromJson(Map<String, dynamic> json) => WeaponStats(
        fireRate: json["fireRate"].toDouble(),
        magazineSize: json["magazineSize"],
        runSpeedMultiplier: json["runSpeedMultiplier"].toDouble(),
        equipTimeSeconds: json["equipTimeSeconds"].toDouble(),
        reloadTimeSeconds: json["reloadTimeSeconds"].toDouble(),
        firstBulletAccuracy: json["firstBulletAccuracy"].toDouble(),
        shotgunPelletCount: json["shotgunPelletCount"],
        wallPenetration: wallPenetrationValues.map[json["wallPenetration"]],
        feature: json["feature"] == null ? null : json["feature"],
        fireMode: json["fireMode"] == null ? null : json["fireMode"],
        altFireType: json["altFireType"] == null ? null : altFireTypeValues.map[json["altFireType"]],
        adsStats: json["adsStats"] == null ? null : AdsStats.fromJson(json["adsStats"]),
        altShotgunStats: json["altShotgunStats"] == null ? null : AltShotgunStats.fromJson(json["altShotgunStats"]),
        airBurstStats: json["airBurstStats"] == null ? null : AirBurstStats.fromJson(json["airBurstStats"]),
        damageRanges: List<DamageRange>.from(json["damageRanges"].map((x) => DamageRange.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "fireRate": fireRate,
        "magazineSize": magazineSize,
        "runSpeedMultiplier": runSpeedMultiplier,
        "equipTimeSeconds": equipTimeSeconds,
        "reloadTimeSeconds": reloadTimeSeconds,
        "firstBulletAccuracy": firstBulletAccuracy,
        "shotgunPelletCount": shotgunPelletCount,
        "wallPenetration": wallPenetrationValues.reverse[wallPenetration],
        "feature": feature == null ? null : feature,
        "fireMode": fireMode == null ? null : fireMode,
        "altFireType": altFireType == null ? null : altFireTypeValues.reverse[altFireType],
        "adsStats": adsStats == null ? null : adsStats!.toJson(),
        "altShotgunStats": altShotgunStats == null ? null : altShotgunStats!.toJson(),
        "airBurstStats": airBurstStats == null ? null : airBurstStats!.toJson(),
        "damageRanges": List<dynamic>.from(damageRanges!.map((x) => x.toJson())),
    };
}

class AdsStats {
    AdsStats({
        this.zoomMultiplier,
        this.fireRate,
        this.runSpeedMultiplier,
        this.burstCount,
        this.firstBulletAccuracy,
    });

    double? zoomMultiplier;
    double? fireRate;
    double? runSpeedMultiplier;
    int? burstCount;
    double? firstBulletAccuracy;

    factory AdsStats.fromJson(Map<String, dynamic> json) => AdsStats(
        zoomMultiplier: json["zoomMultiplier"].toDouble(),
        fireRate: json["fireRate"].toDouble(),
        runSpeedMultiplier: json["runSpeedMultiplier"].toDouble(),
        burstCount: json["burstCount"],
        firstBulletAccuracy: json["firstBulletAccuracy"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "zoomMultiplier": zoomMultiplier,
        "fireRate": fireRate,
        "runSpeedMultiplier": runSpeedMultiplier,
        "burstCount": burstCount,
        "firstBulletAccuracy": firstBulletAccuracy,
    };
}

class AirBurstStats {
    AirBurstStats({
        this.shotgunPelletCount,
        this.burstDistance,
    });

    int? shotgunPelletCount;
    double? burstDistance;

    factory AirBurstStats.fromJson(Map<String, dynamic> json) => AirBurstStats(
        shotgunPelletCount: json["shotgunPelletCount"],
        burstDistance: json["burstDistance"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "shotgunPelletCount": shotgunPelletCount,
        "burstDistance": burstDistance,
    };
}

enum AltFireType { E_WEAPON_ALT_FIRE_DISPLAY_TYPE_ADS, E_WEAPON_ALT_FIRE_DISPLAY_TYPE_AIR_BURST, E_WEAPON_ALT_FIRE_DISPLAY_TYPE_SHOTGUN }

final altFireTypeValues = EnumValues({
    "EWeaponAltFireDisplayType::ADS": AltFireType.E_WEAPON_ALT_FIRE_DISPLAY_TYPE_ADS,
    "EWeaponAltFireDisplayType::AirBurst": AltFireType.E_WEAPON_ALT_FIRE_DISPLAY_TYPE_AIR_BURST,
    "EWeaponAltFireDisplayType::Shotgun": AltFireType.E_WEAPON_ALT_FIRE_DISPLAY_TYPE_SHOTGUN
});

class AltShotgunStats {
    AltShotgunStats({
        this.shotgunPelletCount,
        this.burstRate,
    });

    int? shotgunPelletCount;
    double? burstRate;

    factory AltShotgunStats.fromJson(Map<String, dynamic> json) => AltShotgunStats(
        shotgunPelletCount: json["shotgunPelletCount"],
        burstRate: json["burstRate"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "shotgunPelletCount": shotgunPelletCount,
        "burstRate": burstRate,
    };
}

class DamageRange {
    DamageRange({
        this.rangeStartMeters,
        this.rangeEndMeters,
        this.headDamage,
        this.bodyDamage,
        this.legDamage,
    });

    int? rangeStartMeters;
    int? rangeEndMeters;
    double? headDamage;
    int? bodyDamage;
    double? legDamage;

    factory DamageRange.fromJson(Map<String, dynamic> json) => DamageRange(
        rangeStartMeters: json["rangeStartMeters"],
        rangeEndMeters: json["rangeEndMeters"],
        headDamage: json["headDamage"].toDouble(),
        bodyDamage: json["bodyDamage"],
        legDamage: json["legDamage"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "rangeStartMeters": rangeStartMeters,
        "rangeEndMeters": rangeEndMeters,
        "headDamage": headDamage,
        "bodyDamage": bodyDamage,
        "legDamage": legDamage,
    };
}

enum WallPenetration { E_WALL_PENETRATION_DISPLAY_TYPE_HIGH, E_WALL_PENETRATION_DISPLAY_TYPE_MEDIUM, E_WALL_PENETRATION_DISPLAY_TYPE_LOW }

final wallPenetrationValues = EnumValues({
    "EWallPenetrationDisplayType::High": WallPenetration.E_WALL_PENETRATION_DISPLAY_TYPE_HIGH,
    "EWallPenetrationDisplayType::Low": WallPenetration.E_WALL_PENETRATION_DISPLAY_TYPE_LOW,
    "EWallPenetrationDisplayType::Medium": WallPenetration.E_WALL_PENETRATION_DISPLAY_TYPE_MEDIUM
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
