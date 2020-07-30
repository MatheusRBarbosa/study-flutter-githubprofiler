class GithubRepos {
  final int id;
  final String name;
  final String language;
  final int openIssuesCount; 
  final int forksCount; 
  final int stargazersCount; 

  GithubRepos(
      {
        this.id, 
        this.name,
        this.language, 
        this.openIssuesCount, 
        this.forksCount,
        this.stargazersCount,
      }
    );


  factory GithubRepos.fromJson(Map<String, dynamic> json) {
    return GithubRepos(
        id: json['id'],
        name: json['name'],
        language: json['language'],
        openIssuesCount: json['open_issues_count'],
        forksCount: json['forks_count'],
        stargazersCount: json['stargazers_count'],
    );
  }
}
