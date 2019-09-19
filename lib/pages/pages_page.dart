import 'package:flutter/material.dart';
import 'package:flutter_wordpress/models/page_model.dart';
import 'package:flutter_wordpress/providers/page_provider.dart';

class PagesPage extends StatelessWidget {
  final pageProvider = PageProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pages Wordpress'),
      ),
      body: FutureBuilder(
        future: pageProvider.getAds(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                //itemCount: snapshot.data.length,
                itemBuilder: (context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
                    child: Column(
                      children: <Widget>[
                        _showTitle(snapshot.data[index].title.rendered),
                        //_showDescription(snapshot.data[index].content.rendered),

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
    );
  }



  Widget _showTitle(String title){
    return Text(title);
  }

  Widget _showDescription(String description){
    return Text(description, style:TextStyle(fontSize: 10.0));
  }
}
