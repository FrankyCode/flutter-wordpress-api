// To parse this JSON data, do
//
//     final page = pageFromJson(jsonString);

import 'dart:convert';

List<Page> pagesFromJson(String str) => List<Page>.from(json.decode(str).map((x) => Page.fromJson(x)));

Page pageFromJson(String str) => Page.fromJson(json.decode(str));

String pageToJson(Page data) => json.encode(data.toJson());

String pagesToJson(List<Page> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Page {
    int id;
    DateTime date;
    DateTime dateGmt;
    Guid guid;
    DateTime modified;
    DateTime modifiedGmt;
    String slug;
    StatusEnum status;
    Type type;
    String link;
    Guid title;
    Content content;
    Content excerpt;
    int author;
    int featuredMedia;
    int parent;
    int menuOrder;
    Status commentStatus;
    Status pingStatus;
    String template;
    List<dynamic> meta;
    Links links;

    Page({
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
        this.content,
        this.excerpt,
        this.author,
        this.featuredMedia,
        this.parent,
        this.menuOrder,
        this.commentStatus,
        this.pingStatus,
        this.template,
        this.meta,
        this.links,
    });

    factory Page.fromJson(Map<String, dynamic> json) => Page(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: statusEnumValues.map[json["status"]],
        type: typeValues.map[json["type"]],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        parent: json["parent"],
        menuOrder: json["menu_order"],
        commentStatus: statusValues.map[json["comment_status"]],
        pingStatus: statusValues.map[json["ping_status"]],
        template: json["template"],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
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
        "status": statusEnumValues.reverse[status],
        "type": typeValues.reverse[type],
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "parent": parent,
        "menu_order": menuOrder,
        "comment_status": statusValues.reverse[commentStatus],
        "ping_status": statusValues.reverse[pingStatus],
        "template": template,
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "_links": links.toJson(),
    };
}

enum Status { CLOSED }

final statusValues = EnumValues({
    "closed": Status.CLOSED
});

class Content {
    String rendered;
    bool protected;

    Content({
        this.rendered,
        this.protected,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
    };
}

class Guid {
    String rendered;

    Guid({
        this.rendered,
    });

    factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
    );

    Map<String, dynamic> toJson() => {
        "rendered": rendered,
    };
}

class Links {
    List<About> self;
    List<About> collection;
    List<About> about;
    List<Author> author;
    List<Author> replies;
    List<VersionHistory> versionHistory;
    List<PredecessorVersion> predecessorVersion;
    List<About> wpAttachment;
    List<Cury> curies;
    List<Author> up;

    Links({
        this.self,
        this.collection,
        this.about,
        this.author,
        this.replies,
        this.versionHistory,
        this.predecessorVersion,
        this.wpAttachment,
        this.curies,
        this.up,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: json["predecessor-version"] == null ? null : List<PredecessorVersion>.from(json["predecessor-version"].map((x) => PredecessorVersion.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
        up: json["up"] == null ? null : List<Author>.from(json["up"].map((x) => Author.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "version-history": List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "predecessor-version": predecessorVersion == null ? null : List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
        "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
        "up": up == null ? null : List<dynamic>.from(up.map((x) => x.toJson())),
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

class Cury {
    Name name;
    Href href;
    bool templated;

    Cury({
        this.name,
        this.href,
        this.templated,
    });

    factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: nameValues.map[json["name"]],
        href: hrefValues.map[json["href"]],
        templated: json["templated"],
    );

    Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "href": hrefValues.reverse[href],
        "templated": templated,
    };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = EnumValues({
    "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum Name { WP }

final nameValues = EnumValues({
    "wp": Name.WP
});

class PredecessorVersion {
    int id;
    String href;

    PredecessorVersion({
        this.id,
        this.href,
    });

    factory PredecessorVersion.fromJson(Map<String, dynamic> json) => PredecessorVersion(
        id: json["id"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
    };
}

class VersionHistory {
    int count;
    String href;

    VersionHistory({
        this.count,
        this.href,
    });

    factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
    };
}

enum StatusEnum { PUBLISH }

final statusEnumValues = EnumValues({
    "publish": StatusEnum.PUBLISH
});

enum Type { PAGE }

final typeValues = EnumValues({
    "page": Type.PAGE
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
