import 'package:flutter/material.dart';
import 'package:githubapp/models/GithubUser.dart';
import '../Utils/Utils.dart';

Widget cardContent(AsyncSnapshot<GithubUser> snapshot) {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _leftColumn(snapshot),
        _rightColumn(snapshot),
      ],
    ),
  );
}

Widget _leftColumn(AsyncSnapshot<GithubUser> snapshot) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      _avatar(snapshot.data.avatarUrl),
      Utils.titleFormatting(snapshot.data.name),
      Text(snapshot.data.login)
    ],
  );
}

Widget _rightColumn(AsyncSnapshot<GithubUser> snapshot) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Utils.info('Repositórios', snapshot.data.publicRepos),
      Utils.info('Seguidores', snapshot.data.followers),
      Utils.info('Seguindo', snapshot.data.following)
    ],
  );
}

// LeftColumn
Widget _avatar(String avatarUrl) {
  return Container(
      margin: EdgeInsets.all(10.0),
      width: 105.0,
      height: 105.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fill, image: NetworkImage(avatarUrl))));
}
