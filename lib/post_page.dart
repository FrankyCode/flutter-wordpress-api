import 'package:flutter/material.dart';
import 'package:flutter_wordpress/providers/post_providers.dart';

class PostPage extends StatelessWidget {
  final postProvider = new PostProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WordPress APi"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            showPosts(),
          ],
        ),
      ),
    );
  }

  Widget showPosts() {
    //postProvider.getPosts();
    return FutureBuilder(
      future: postProvider.getPosts(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return Container(
            alignment: Alignment.center,
            //color: Colors.amberAccent,
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.86,
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom:15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Title Post: ${snapshot.data[index].title.rendered}"),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: FadeInImage(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.8,
                          image: NetworkImage(
                              snapshot.data[index].jetpackFeaturedMediaUrl),
                          placeholder: AssetImage('assets/img/no-image.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return Container(
            height: MediaQuery.of(context).size.height * 0.8,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
