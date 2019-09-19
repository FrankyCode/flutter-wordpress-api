
import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    int id;
    DateTime date;
    DateTime dateGmt;
    Guid guid;
    DateTime modified;
    DateTime modifiedGmt;
    String slug;
    String status;
    String type;
    String link;
    Guid title;
    Content content;
    Content excerpt;
    int author;
    int featuredMedia;
    String commentStatus;
    String pingStatus;
    bool sticky;
    String template;
    String format;
    List<dynamic> meta;
    List<int> categories;
    List<dynamic> tags;
    Links links;

    Post({
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
        this.commentStatus,
        this.pingStatus,
        this.sticky,
        this.template,
        this.format,
        this.meta,
        this.categories,
        this.tags,
        this.links,
    });

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        sticky: json["sticky"],
        template: json["template"],
        format: json["format"],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        categories: List<int>.from(json["categories"].map((x) => x)),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
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
        "status": status,
        "type": type,
        "link": link,
        "title": title.toJson(),
        "content": content.toJson(),
        "excerpt": excerpt.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "sticky": sticky,
        "template": template,
        "format": format,
        "meta": List<dynamic>.from(meta.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "_links": links.toJson(),
    };


   
}

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
    List<Author> wpFeaturedmedia;
    List<About> wpAttachment;
    List<WpTerm> wpTerm;
    List<Cury> curies;

    Links({
        this.self,
        this.collection,
        this.about,
        this.author,
        this.replies,
        this.versionHistory,
        this.predecessorVersion,
        this.wpFeaturedmedia,
        this.wpAttachment,
        this.wpTerm,
        this.curies,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: List<PredecessorVersion>.from(json["predecessor-version"].map((x) => PredecessorVersion.fromJson(x))),
        wpFeaturedmedia: List<Author>.from(json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm: List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "author": List<dynamic>.from(author.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies.map((x) => x.toJson())),
        "version-history": List<dynamic>.from(versionHistory.map((x) => x.toJson())),
        "predecessor-version": List<dynamic>.from(predecessorVersion.map((x) => x.toJson())),
        "wp:featuredmedia": List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
        "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
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
    String name;
    String href;
    bool templated;

    Cury({
        this.name,
        this.href,
        this.templated,
    });

    factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
    };
}

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

class WpTerm {
    String taxonomy;
    bool embeddable;
    String href;

    WpTerm({
        this.taxonomy,
        this.embeddable,
        this.href,
    });

    factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: json["taxonomy"],
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy,
        "embeddable": embeddable,
        "href": href,
    };





    
}
