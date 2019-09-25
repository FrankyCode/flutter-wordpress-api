import 'package:flutter/material.dart';
import 'package:flutter_wordpress/providers/page_provider.dart';

class PagesPage extends StatelessWidget {
  final pageProvider = PageProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADS'),
      ),
      body: FutureBuilder(
        future: pageProvider.getInfoAds(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
                    child: Column(
                      children: <Widget>[
                        _showImage(context, snapshot.data[index])
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
