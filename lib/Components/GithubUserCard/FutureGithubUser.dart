import 'package:flutter/material.dart';
import 'package:githubapp/models/GithubUser.dart';
import 'GithubUserCard.dart';

Widget _divider() {
  return Divider(
    color: Colors.black,
    height: 30,
    thickness: 3,
    indent: 60,
    endIndent: 60,
  );
}

Widget futureGithubUser(Future<GithubUser> future) {
  return FutureBuilder<GithubUser>(
    future: future,
    builder: (context, snapshot) {
      if (snapshot.hasData &&
          snapshot.connectionState == ConnectionState.done) {
        return Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 220,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: cardContent(snapshot),
              ),
            ),
            _divider()
          ],
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      } else if (snapshot.connectionState == ConnectionState.done &&
          snapshot.data == null) {
        return Center(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/404.png',
                height: 300,
              ),
              Text(
                'Usuário não encontrado',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      }
      return Center(child: CircularProgressIndicator(), heightFactor: 10);
    },
  );
}
