import 'package:flutter/material.dart';
import 'package:githubapp/models/GithubRepos.dart';
import 'package:githubapp/models/GithubUser.dart';
import '../Utils/Utils.dart';

Widget repoCardContent(GithubRepos repo) {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[_firstRow(repo), _secondRow(repo)],
    ),
  );
}

Widget _firstRow(GithubRepos repo) {
  var language = '';
  if (repo.language != null) {
    language = repo.language;
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[Utils.titleFormatting(repo.name, 24), Text(language)],
  );
}

Widget _secondRow(GithubRepos repo) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Utils.infoIcon('star', repo.stargazersCount),
      Utils.infoIcon('issues', repo.openIssuesCount),
      Utils.infoIcon('forks', repo.forksCount),
    ],
  );
}
