import 'dart:convert';
import 'package:githubapp/models/GithubUser.dart';
import 'package:githubapp/models/GithubRepos.dart';
import 'package:http/http.dart' as http;

Future<GithubUser> fetchUser(String username) async {
  final response = await http.get('https://api.github.com/users/$username');

  if (response.statusCode == 200) {
    GithubUser user = GithubUser.fromJson(json.decode(response.body));
    user.repos = await fetchRepos(user.login);
    return user;
  } else if (response.statusCode == 404) {
    return null;
  }
}

fetchRepos(String login) async {
  List<GithubRepos> list = List();
  final response = await http.get('https://api.github.com/users/$login/repos');

  if (response.statusCode == 200) {
    list = (json.decode(response.body) as List)
        .map((data) => new GithubRepos.fromJson(data))
        .toList();

    return list;
  }
}

Future<GithubUser> updateRepos(
    GithubUser user, List<GithubRepos> filteredRepos) async {
  user.repos = filteredRepos;
  return user;
}
