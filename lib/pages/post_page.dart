import 'package:flutter/material.dart';
import 'package:flutter_wordpress/preferences/user_preferences.dart';

import 'package:flutter_wordpress/providers/post_provider.dart';

class PostPage extends StatelessWidget {
  final postProvider = new PostProvider();
  final prefs = new UserPreferences();
  static final String routename = 'post';

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = PostPage.routename;
    return Scaffold(
      appBar: AppBar(
        title: Text("WordPress APi"),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.pages),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'pages');
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: Container(
        child: showPosts(),
      ),
    );
  }

  Widget showPosts() {
    //postProvider.getPosts();
    return FutureBuilder(
      future: postProvider.getBoth(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //color: Colors.greenAccent,
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.65,
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Text(snapshot.data['title'])
                        _showText(context, snapshot.data[index].first),
                        _showImage(context, snapshot.data[index].last),
                      ],
                    ),
                  );
                });
          }
        }
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _showText(BuildContext context, String text) {
    return Container(
      //color: Colors.purpleAccent,
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.8,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _showImage(BuildContext context, String img) {
    return Container(
      // color: Colors.pinkAccent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: FadeInImage(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          image: NetworkImage(img),
          placeholder: AssetImage('assets/img/no-image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
