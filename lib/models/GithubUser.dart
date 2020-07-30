import 'package:githubapp/models/GithubRepos.dart';

class GithubUser {
  final int id;
  final String avatarUrl;
  final String login;
  final String name;
  final int followers; 
  final int following; 
  final int publicRepos;
  List<GithubRepos> repos;

  GithubUser({
      this.id, 
      this.avatarUrl, 
      this.login, 
      this.name,
      this.followers,
      this.following,
      this.publicRepos,
    });

  factory GithubUser.fromJson(Map<String, dynamic> json) {
    return GithubUser(
        id: json['id'],
        avatarUrl: json['avatar_url'],
        login: json['login'],
        name: json['name'],
        followers: json['followers'],
        following: json['following'],
        publicRepos: json['public_repos']
        );
  }
}
