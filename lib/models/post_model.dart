
import 'dart:io';

class Posts{

  List<Post> items = new List();

  Posts();

  Posts.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null ) return;

    for(var item in jsonList){
      final post = Post.fromJsonMap(item);
      items.add(post);
    }
  }


}

class Post {
  int id;
  String date;
  String dateGmt;
  Guid guid;
  String modified;
  String modifiedGmt;
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
  String jetpackFeaturedMediaUrl;
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
    this.jetpackFeaturedMediaUrl,
    this.links,
  });



  Post.fromJsonMap( Map<String, dynamic> json ){
    id                      = json['id'];
    date                    = json['date'];
    dateGmt                 = json['date_gmt'];
    guid                    = Guid.fromJsonMap(json['guid']);
    modified                = json['modified'];
    modifiedGmt             = json['modified_gmt'];
    slug                    = json['slug'];
    status                  = json['status'];
    type                    = json['type'];
    link                    = json['link'];
    title                   = Guid.fromJsonMap(json['title']);
    content                 = Content.fromJsonMap(json['content']);
    excerpt                 = Content.fromJsonMap(json['excerpt']);
    author                  = json['author'];
    featuredMedia           = json['featured_media'];
    commentStatus           = json['comment_status'];
    pingStatus              = json['ping_status'];
    sticky                  = json['sticky'];
    template                = json['template'];
    format                  = json['format'];
    meta                    = json['meta'];
    categories              = json['categories'].cast<int>();
    tags                    = json['tags'];
    jetpackFeaturedMediaUrl = json['jetpack_featured_media_url'];
    links                   = Links.fromJsonMap(json['_links']);
  }



}

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


  Links.fromJsonMap(Map<String, dynamic> json){
    self                = recorrerListaAbout('self', json);
    collection          = recorrerListaAbout('collection', json);
    about               = recorrerListaAbout('about', json);
    author              = recorrerListaAuthor('author', json);
    replies             = recorrerListaAuthor('replies', json);
    versionHistory      = recorrerListaVersion('version-history', json);
    predecessorVersion  = recorrerListaPredeccesor('predecessor-version', json);
    wpFeaturedmedia     = recorrerListaAuthor('wp:featuredmedia', json);
    wpAttachment        = recorrerListaAbout('wp:attachment', json);
    wpTerm              = recorrerListaWpTerm('wp:term', json);
    curies              = recorrerListaCuriesn('curies', json);

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
  recorrerListaWpTerm(String valor, json){
     var list = json[valor] as List;
  //  print(list.runtimeType);
    List<WpTerm> aboutList = list.map((i) => WpTerm.fromJsonMap(i)).toList();
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
  String name;
  String href;
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

class WpTerm {
  String taxonomy;
  bool embeddable;
  String href;

  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  WpTerm.fromJsonMap(Map<String, dynamic> json){
    taxonomy    = json['taxonomy'];
    embeddable  = json['embeddable'];
    href        = json['href'];

  }
}
