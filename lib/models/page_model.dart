
class Pages {

  List<Page> items = new List();

  Pages();

  Pages.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      final page = Page.fromJsonMap(item);
      items.add(page);
    }
  }


}



class Page {
  int id;
  String date;
  String dateGmt;
  Guid guid;
  String modified;
  String modifiedGmt;
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

  Page.fromJsonMap(Map<String, dynamic> json){
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'];
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'];
    content = json['content'];
    excerpt = json['excerpt'];
    author = json['author'];
    featuredMedia = json['featured_media'];
    parent = json['parent'];
    menuOrder = json['menu_order'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    template = json['template'];
    meta = json['meta'];
    links = json['_links'];
  }

}

enum Status { CLOSED }

class Content {
  String rendered;
  bool protected;

  Content({
    this.rendered,
    this.protected,
  });

   Content.fromJsonMap( Map<String, dynamic> json ){
    rendered = json['rendered'];
    protected = json['protected'];
  }
}

class Guid {
  String rendered;

  Guid({
    this.rendered,
  });

  Guid.fromJsonMap(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }
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

  Links.fromJsonMap(Map<String, dynamic> json){
    self                = recorrerListaAbout('self', json);
    collection          = recorrerListaAbout('collection', json);
    about               = recorrerListaAbout('about', json);
    author              = recorrerListaAuthor('author', json);
    replies             = recorrerListaAuthor('replies', json);
    versionHistory      = recorrerListaVersion('version-history', json);
    predecessorVersion  = recorrerListaPredeccesor('predecessor-version', json);
    wpAttachment        = recorrerListaAbout('wp:attachment', json);
    curies              = recorrerListaCuriesn('curies', json);
    up = json['up'];
  }


   recorrerListaAbout(String valor, json){
     var list = json[valor] as List;
  //  print(list.runtimeType);
    List<About> aboutList = list.map((i) => About.fromJsonMap(i)).toList();
    return aboutList;
  }

  recorrerListaAuthor(String valor, json){
      var list = json[valor] as List;
  //  print(list.runtimeType);
    List<Author> aboutList = list.map((i) => Author.fromJsonMap(i)).toList();
    return aboutList;
  }

  recorrerListaVersion(String valor, json){
     var list = json[valor] as List;
  //  print(list.runtimeType);
    List<VersionHistory> aboutList = list.map((i) => VersionHistory.fromJsonMap(i)).toList();
    return aboutList;
  }
  recorrerListaPredeccesor(String valor, json){
     var list = json[valor] as List;
  //  print(list.runtimeType);
    List<PredecessorVersion> aboutList = list.map((i) => PredecessorVersion.fromJsonMap(i)).toList();
    return aboutList;
  }
 
  recorrerListaCuriesn(String valor, json){
     var list = json[valor] as List;
  //  print(list.runtimeType);
    List<Cury> aboutList = list.map((i) => Cury.fromJsonMap(i)).toList();
    return aboutList;
  }

}

class About {
  String href;

  About({
    this.href,
  });

  About.fromJsonMap(Map<String, dynamic> json){
    href = json['href'];
  }
}

class Author {
  bool embeddable;
  String href;

  Author({
    this.embeddable,
    this.href,
  });

  Author.fromJsonMap(Map<String, dynamic> json){
    embeddable  = json['embeddable'];
    href        = json['href'];
  }
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

   Cury.fromJsonMap(Map<String, dynamic> json){
    name      = json['name'];
    href      = json['href'];
    templated = json['templated'];
  }
}

enum Href { HTTPS_API_W_ORG_REL }

enum Name { WP }

class PredecessorVersion {
  int id;
  String href;

  PredecessorVersion({
    this.id,
    this.href,
  });

  PredecessorVersion.fromJsonMap(Map<String, dynamic> json){
    id    = json['id'];
    href  = json['href'];
  }
}

class VersionHistory {
  int count;
  String href;

  VersionHistory({
    this.count,
    this.href,
  });

  VersionHistory.fromJsonMap(Map<String, dynamic> json){
    count = json['count'];
    href  = json['href'];
  }
}

enum StatusEnum { PUBLISH }

enum Type { PAGE }
