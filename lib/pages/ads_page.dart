import 'package:flutter/material.dart';
import 'package:flutter_wordpress/models/ads_model.dart';
import 'package:flutter_wordpress/preferences/user_preferences.dart';
import 'package:flutter_wordpress/providers/ads_provider.dart';

class AdsPage extends StatelessWidget {
  final prefs = new UserPreferences();
  final ads = new AdsProvider();
  static final String routename = 'pages';

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = AdsPage.routename;

    return Scaffold(
      appBar: AppBar(
        title: Text('ADS'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.local_post_office),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'post');
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.height * 0.05,
        ),
        child: FutureBuilder(
          future: ads.getAds(),
          builder: (BuildContext context, AsyncSnapshot<List<Ads>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, int index) {
                    return Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  _showAuthorAvatar(context,
                                      snapshot.data[index].author.avatar),
                                      SizedBox(width: 10,),
                                  _showTitle(context,
                                      'Nick: ${snapshot.data[index].author.nickname}'),
                                ],
                              ),
                              _showTitle(context, 'Ad Title: ${snapshot.data[index].title}'),
                              _showTitle(
                                context,
                                'Ad Category: ${snapshot.data[index].advertCategory[0].name}',
                              ),
                            ],
                          ),
                          _showImage(context,
                              snapshot.data[index].featuredImage.large),
                        ],
                      ),
                    );
                  },
                );
              }
            } else {
              return Container(
                height: MediaQuery.of(context).size.height * 0.8,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _showImage(BuildContext context, String img) {
    return Container(
      // color: Colors.pinkAccent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: FadeInImage(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.4,
          image: NetworkImage(img),
          placeholder: AssetImage('assets/img/no-image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _showTitle(BuildContext context, String title) {
    return Container(
      child: Text(title),
    );
  }

 

  Widget _showAuthorAvatar(BuildContext context, String author) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: FadeInImage(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.15,
          image: NetworkImage(author),
          placeholder: AssetImage('assets/img/no-image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
