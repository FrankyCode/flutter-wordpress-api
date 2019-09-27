// To parse this JSON data, do
//
//     final ads = adsFromJson(jsonString);

import 'dart:convert';

List<Ads> adsFromJson(String str) => List<Ads>.from(json.decode(str).map((x) => Ads.fromJson(x)));

String adsToJson(List<Ads> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ads {
    int id;
    String title;
    String content;
    String slug;
    Author author;
    List<Advert> advertCategory;
    List<Advert> advertLocation;
    FeaturedImage featuredImage;

    Ads({
        this.id,
        this.title,
        this.content,
        this.slug,
        this.author,
        this.advertCategory,
        this.advertLocation,
        this.featuredImage,
    });

    factory Ads.fromJson(Map<String, dynamic> json) => Ads(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        slug: json["slug"],
        author: Author.fromJson(json["author"]),
        advertCategory: List<Advert>.from(json["advert_category"].map((x) => Advert.fromJson(x))),
        advertLocation: List<Advert>.from(json["advert_location"].map((x) => Advert.fromJson(x))),
        featuredImage: FeaturedImage.fromJson(json["featured_image"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "slug": slug,
        "author": author.toJson(),
        "advert_category": List<dynamic>.from(advertCategory.map((x) => x.toJson())),
        "advert_location": List<dynamic>.from(advertLocation.map((x) => x.toJson())),
        "featured_image": featuredImage.toJson(),
    };
}

class Advert {
    int termId;
    String name;
    String slug;
    int termGroup;
    int termTaxonomyId;
    String taxonomy;
    String description;
    int parent;
    int count;
    String filter;

    Advert({
        this.termId,
        this.name,
        this.slug,
        this.termGroup,
        this.termTaxonomyId,
        this.taxonomy,
        this.description,
        this.parent,
        this.count,
        this.filter,
    });

    factory Advert.fromJson(Map<String, dynamic> json) => Advert(
        termId: json["term_id"],
        name: json["name"],
        slug: json["slug"],
        termGroup: json["term_group"],
        termTaxonomyId: json["term_taxonomy_id"],
        taxonomy: json["taxonomy"],
        description: json["description"],
        parent: json["parent"],
        count: json["count"],
        filter: json["filter"],
    );

    Map<String, dynamic> toJson() => {
        "term_id": termId,
        "name": name,
        "slug": slug,
        "term_group": termGroup,
        "term_taxonomy_id": termTaxonomyId,
        "taxonomy": taxonomy,
        "description": description,
        "parent": parent,
        "count": count,
        "filter": filter,
    };
}

class Author {
    String id;
    String nickname;
    String avatar;
    String userStatus;

    Author({
        this.id,
        this.nickname,
        this.avatar,
        this.userStatus,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["id"],
        nickname: json["nickname"],
        avatar: json["avatar"],
        userStatus: json["user_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nickname": nickname,
        "avatar": avatar,
        "user_status": userStatus,
    };
}

class FeaturedImage {
    String thumbnail;
    String medium;
    String large;

    FeaturedImage({
        this.thumbnail,
        this.medium,
        this.large,
    });

    factory FeaturedImage.fromJson(Map<String, dynamic> json) => FeaturedImage(
        thumbnail: json["thumbnail"],
        medium: json["medium"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "medium": medium,
        "large": large,
    };
}
