import 'package:flutter/material.dart';
import 'package:githubapp/models/GithubRepos.dart';
import 'package:githubapp/models/GithubUser.dart';
import 'GithubReposCard.dart';

Widget futureGithubRepos(Future<GithubUser> future) {
  return FutureBuilder<GithubUser>(
    future: future,
    builder: (context, snapshot) {
      if (snapshot.hasData &&
          snapshot.connectionState == ConnectionState.done) {
        return Column(
          children: snapshot.data.repos.map((e) => _repoCard(e)).toList(),
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }
      return Center();
    },
  );
}

Widget _repoCard(GithubRepos repo) {
  return Container(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
    height: 220,
    width: double.maxFinite,
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: repoCardContent(repo),
    ),
  );
}
