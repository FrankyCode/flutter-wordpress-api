class Medias {

  List<Media> items = new List();

  Medias();

  Medias.fromJsonList(List<dynamic> jsonList){

    if(jsonList == null) return;

    for(var item in jsonList){
      final media = Media.fromJsonMap(item);
      items.add(media);
    }
    
  }

}


class Media {
  int id;
  int author;
  int post;
  String date;
  String dateGmt;
  String link;
  String modified;
  String modifiedGmt;
  String slug;
  String template;
  String altText;
  String sourceUrl;
  Caption guid;
  Caption title;
  Caption description;
  Caption caption;
  Status status;
  Type type; 
  CommentStatus commentStatus;
  PingStatus pingStatus;
  List<dynamic> meta;
  MediaType mediaType;
  MimeType mimeType;
  MediaDetails mediaDetails;
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

  Media.fromJsonMap(Map<String, dynamic> json){
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = Caption.fromJsonMap(json['guid']);
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    slug = json['slug'];
    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = Caption.fromJsonMap(json['title']);
    author = json['author'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    template = json['template'];
    meta = json['meta'];
    description = Caption.fromJsonMap(json['description']);
    caption = Caption.fromJsonMap(json['caption']);
    altText = json['alt_text'];
    mediaType = json['meida_type'];
    mimeType = json['mime_type'];
    mediaDetails = MediaDetails.fromJsonMap(json['media_details']);
    post = json['post'];
    sourceUrl = json['source_url'];
    links = Links.fromJsonMap(json['_links']);
  }

  convertEnum(String str){
    String str = Status.INHERIT.toString();
    Status st = Status.values.firstWhere((e) => e.toString() == 'Status' + str);
    assert(st == Status.INHERIT);
  }
}

class Caption {
  String rendered;

  Caption({
    this.rendered,
  });

  Caption.fromJsonMap(Map<String, dynamic> json){
    rendered = json['rendered'];
  }
}

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

  Links.fromJsonMap(Map<String, dynamic> json){
    self                = recorrerListaAbout('self', json);
    collection          = recorrerListaAbout('collection', json);
    about               = recorrerListaAbout('about', json);
    author              = recorrerListaAuthor('author', json);
    replies             = recorrerListaAuthor('replies', json);
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

  MediaDetails.fromJsonMap(Map<String, dynamic> json){
    width = json['width'];
    height = json['height'];
    file = json['file'];
    sizes = json['sizes'];
    imageMeta = ImageMeta.fromJsonMap(json['image_meta']);
  }


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

  ImageMeta.fromJsonMap(Map<String, dynamic> json){
      aperture = json['aperture'];
      credit = json['credit'];
      camera = json['camera'];
      caption = json['caption'];
      createdTimestamp = json['created_timestamp'];
      copyright = json['copyright'];
      focalLength = json['focal_length'];
      iso = json['iso'];
      shutterSpeed = json['shutter_speed'];
      title = json['title'];
      orientation = json['orientation'];
      keywords = json['keywords'];

  }

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

  Size.fromJsonMap(Map<String, dynamic> json){
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }
}

enum MimeType { IMAGE_JPEG, IMAGE_PNG }

enum MediaType { IMAGE }

enum PingStatus { CLOSED }


enum Status { INHERIT }

enum CommentStatus { OPEN }

enum Type { ATTACHMENT }
