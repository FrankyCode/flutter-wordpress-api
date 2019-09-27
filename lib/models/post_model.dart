// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
    int id;
    String title;
    String content;
    String slug;
    FeaturedImage featuredImage;

    Posts({
        this.id,
        this.title,
        this.content,
        this.slug,
        this.featuredImage,
    });

    factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        slug: json["slug"],
        featuredImage: FeaturedImage.fromJson(json["featured_image"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "slug": slug,
        "featured_image": featuredImage.toJson(),
    };
}

class FeaturedImage {
    dynamic thumbnail;
    dynamic medium;
    dynamic large;

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
