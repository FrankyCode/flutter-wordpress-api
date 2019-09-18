

class Users{

  List<User> items = new List();
  Users();

  Users.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;

    for(var item in jsonList){
      final user = User.fromJsonMap(item);
      items.add(user);
    }

  }


}



class User {
  int id;
  String name;
  String url;
  String description;
  String link;
  String slug;
  Map<String, dynamic> avatarUrls;
  List<dynamic> meta;
  Map<String, dynamic> woocommerceMeta;
  Links links;

  User({
    this.id,
    this.name,
    this.url,
    this.description,
    this.link,
    this.slug,
    this.avatarUrls,
    this.meta,
    this.woocommerceMeta,
    this.links,
  });

  User.fromJsonMap(Map<String, dynamic> json){
    id              = json['id'];
    name            = json['name'];
    url             = json['url'];
    description     = json['description'];
    link            = json['link'];
    slug            = json['slug'];
    avatarUrls      = json['avatar_urls'];
    meta            = json['meta'];
    woocommerceMeta = json['woocommerce_meta'];
    links           = Links.fromJsonMap(json['_links']);
  }
}

class Links {
  List<Collection> self;
  List<Collection> collection;

  Links({
    this.self,
    this.collection,
  });

  Links.fromJsonMap(Map<String, dynamic> json){
    self        = recorrerListCollection('self', json);
    collection  = recorrerListCollection('collection', json);
  }
}

recorrerListCollection(String valor, json){
  var list = json[valor] as List;
  List<Collection> aboutList = list.map((i) => Collection.fromJsonMap(i)).toList();
  return aboutList;
}

class Collection {
  String href;

  Collection({
    this.href,
  });

  Collection.fromJsonMap(Map<String, dynamic> json){
    href = json['href'];
  }
}
