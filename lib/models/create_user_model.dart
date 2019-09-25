// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    int id;
    String username;
    String name;
    String firstName;
    String lastName;
    String email;
    String url;
    String description;
    String link;
    String locale;
    String nickname;
    String slug;
    DateTime registeredDate;
    List<dynamic> role;
    String password;
    Capabilities capabilities;
    ExtraCapabilities extraCapabilities;
    Map<String, String> avatarUrls;
    Meta meta;

    User({
        this.id,
        this.username,
        this.name,
        this.firstName,
        this.lastName,
        this.email,
        this.url,
        this.description,
        this.link,
        this.locale,
        this.nickname,
        this.slug,
        this.registeredDate,
        this.role,
        this.password,
        this.capabilities,
        this.extraCapabilities,
        this.avatarUrls,
        this.meta,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        url: json["url"],
        description: json["description"],
        link: json["link"],
        locale: json["locale"],
        nickname: json["nickname"],
        slug: json["slug"],
        registeredDate: DateTime.parse(json["registered_date"]),
        role: List<dynamic>.from(json["role"].map((x) => x)),
        password: json["password"],
        capabilities: Capabilities.fromJson(json["capabilities"]),
        extraCapabilities: ExtraCapabilities.fromJson(json["extra_capabilities"]),
        avatarUrls: Map.from(json["avatar_urls"]).map((k, v) => MapEntry<String, String>(k, v)),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "url": url,
        "description": description,
        "link": link,
        "locale": locale,
        "nickname": nickname,
        "slug": slug,
        "registered_date": registeredDate.toIso8601String(),
        "role": List<dynamic>.from(role.map((x) => x)),
        "password": password,
        "capabilities": capabilities.toJson(),
        "extra_capabilities": extraCapabilities.toJson(),
        "avatar_urls": Map.from(avatarUrls).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "meta": meta.toJson(),
    };
}

class Capabilities {
    Capabilities();

    factory Capabilities.fromJson(Map<String, dynamic> json) => Capabilities(
    );

    Map<String, dynamic> toJson() => {
    };
}

class ExtraCapabilities {
    ExtraCapabilities();

    factory ExtraCapabilities.fromJson(Map<String, dynamic> json) => ExtraCapabilities(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Meta {
    Meta();

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    );

    Map<String, dynamic> toJson() => {
    };
}