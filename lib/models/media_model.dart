

import 'dart:convert';

List<Media> mediaFromJson(String str) => List<Media>.from(json.decode(str).map((x) => Media.fromJson(x)));

String mediaToJson(List<Media> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Media {
    int id;
    DateTime date;
    DateTime dateGmt;
    Caption guid;
    DateTime modified;
    DateTime modifiedGmt;
    String slug;
    Status status;
    Type type;
    String link;
    Caption title;
    int author;
    CommentStatus commentStatus;
    PingStatus pingStatus;
    String template;
    List<dynamic> meta;
    Caption description;
    Caption caption;
    String altText;
    MediaType mediaType;
    MimeType mimeType;
    MediaDetails mediaDetails;
    int post;
    String sourceUrl;
    Links links;

    Media({
        this.id,
        this.date,
        this.dateGmt,
        this.guid,
        this.modified,
        this.modifiedGmt,
        this.slug,
        this.status,
        this.type,
        this.link,
        this.title,
        this.author,
        this.commentStatus,
        this.pingStatus,
        this.template,
        this.meta,
        this.description,
        this.caption,
        this.altText,
        this.mediaType,
        this.mimeType,
        this.mediaDetails,
        this.post,
        this.sourceUrl,
        this.links,
    });

    factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Caption.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: statusValues.map[json["status"]],
        type: typeValues.map[json["type"]],
        link: json["link"],
        title: Caption.fromJson(json["title"]),
        author: json["author"],
        commentStatus: commentStatusValues.map[json["comment_status"]],
        pingStatus: pingStatusValues.map[json["ping_status"]],
        template: json["template"],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        description: Caption.fromJson(json["description"]),
        caption: Caption.fromJson(json["caption"]),
        altText: json["alt_text"],
        mediaType: mediaTypeValues.map[json["media_type"]],
        mimeType: mimeTypeValues.map[json["mime_type"]],
        mediaDetails: MediaDetails.fromJson(json["media_details"]),
        post: json["post"] == null ? null : json["post"],
        sourceUrl: json["source_url"],
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "date_gmt": dateGmt.toIso8601String(),
        "guid": guid.toJson(),
        "modified": modified.toIso8601String(),
        "modified_gmt": modifiedGmt.toIso8601String(),
        "slug": slug,
        "status": statusValues.reverse[status],
        "type": typeValues.reverse[type],
        "link": link,
        "title": title.toJson(),
        "author": author,
        "comment_status": commentStatusValues.reverse[commentStatus],
        "ping_status": pingStatusValues.reverse[pingStatus],
        "template": template,
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "description": description.toJson(),
        "caption": caption.toJson(),
        "alt_text": altText,
        "media_type": mediaTypeValues.reverse[mediaType],
        "mime_type": mimeTypeValues.reverse[mimeType],
        "media_details": mediaDetails.toJson(),
        "post": post == null ? null : post,
        "source_url": sourceUrl,
        "_links": links.toJson(),
    };
}

class Caption {
    String rendered;

    Caption({
        this.rendered,
    });

    factory Caption.fromJson(Map<String, dynamic> json) => Caption(
        rendered: json["rendered"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
    };
}

enum CommentStatus { OPEN }

final commentStatusValues = EnumValues({
    "open": CommentStatus.OPEN
});

class Links {
    List<About> self;
    List<About> collection;
    List<About> about;
    List<Author> author;
    List<Author> replies;

    Links({
        this.self,
        this.collection,
        this.about,
        this.author,
        this.replies,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
    };
}

class About {
    String href;

    About({
        this.href,
    });

    factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Author {
    bool embeddable;
    String href;

    Author({
        this.embeddable,
        this.href,
    });

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
    };
}

class MediaDetails {
    int width;
    int height;
    String file;
    Map<String, Size> sizes;
    ImageMeta imageMeta;

    MediaDetails({
        this.width,
        this.height,
        this.file,
        this.sizes,
        this.imageMeta,
    });

    factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
        width: json["width"],
        height: json["height"],
        file: json["file"],
        sizes: Map.from(json["sizes"]).map((k, v) => MapEntry<String, Size>(k, Size.fromJson(v))),
        imageMeta: ImageMeta.fromJson(json["image_meta"]),
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "sizes": Map.from(sizes).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "image_meta": imageMeta.toJson(),
    };
}

class ImageMeta {
    String aperture;
    String credit;
    String camera;
    String caption;
    String createdTimestamp;
    String copyright;
    String focalLength;
    String iso;
    String shutterSpeed;
    String title;
    String orientation;
    List<dynamic> keywords;

    ImageMeta({
        this.aperture,
        this.credit,
        this.camera,
        this.caption,
        this.createdTimestamp,
        this.copyright,
        this.focalLength,
        this.iso,
        this.shutterSpeed,
        this.title,
        this.orientation,
        this.keywords,
    });

    factory ImageMeta.fromJson(Map<String, dynamic> json) => ImageMeta(
        aperture: json["aperture"],
        credit: json["credit"],
        camera: json["camera"],
        caption: json["caption"],
        createdTimestamp: json["created_timestamp"],
        copyright: json["copyright"],
        focalLength: json["focal_length"],
        iso: json["iso"],
        shutterSpeed: json["shutter_speed"],
        title: json["title"],
        orientation: json["orientation"],
        keywords: List<dynamic>.from(json["keywords"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "aperture": aperture,
        "credit": credit,
        "camera": camera,
        "caption": caption,
        "created_timestamp": createdTimestamp,
        "copyright": copyright,
        "focal_length": focalLength,
        "iso": iso,
        "shutter_speed": shutterSpeed,
        "title": title,
        "orientation": orientation,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
    };
}

class Size {
    String file;
    int width;
    int height;
    MimeType mimeType;
    String sourceUrl;

    Size({
        this.file,
        this.width,
        this.height,
        this.mimeType,
        this.sourceUrl,
    });

    factory Size.fromJson(Map<String, dynamic> json) => Size(
        file: json["file"],
        width: json["width"],
        height: json["height"],
        mimeType: mimeTypeValues.map[json["mime_type"]],
        sourceUrl: json["source_url"],
    );

    Map<String, dynamic> toJson() => {
        "file": file,
        "width": width,
        "height": height,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "source_url": sourceUrl,
    };
}

enum MimeType { IMAGE_JPEG, IMAGE_PNG }

final mimeTypeValues = EnumValues({
    "image/jpeg": MimeType.IMAGE_JPEG,
    "image/png": MimeType.IMAGE_PNG
});

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({
    "image": MediaType.IMAGE
});

enum PingStatus { CLOSED }

final pingStatusValues = EnumValues({
    "closed": PingStatus.CLOSED
});

enum Status { INHERIT }

final statusValues = EnumValues({
    "inherit": Status.INHERIT
});

enum Type { ATTACHMENT }

final typeValues = EnumValues({
    "attachment": Type.ATTACHMENT
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
