import 'package:flutter/material.dart';
import 'package:githubapp/models/GithubRepos.dart';
import 'package:githubapp/services/api.dart';
import 'package:githubapp/models/GithubUser.dart';
import 'package:githubapp/Components/GithubUserCard/FutureGithubUser.dart';
import 'package:githubapp/Components/GithubReposCard/FutureGithubRepos.dart';
import 'package:githubapp/Components/SpeedDialWidget/SpeedDialWidget.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Future<GithubUser> _futureGithubUser;
  bool alreadyFiltered = false;

  // Controles de estados
  void _setUser(String username) async {
    setState(() {
      _futureGithubUser = fetchUser(username);
    });
  }

  void _setRepos(GithubUser user, List<GithubRepos> filteredRepos) {
    setState(() {
      _futureGithubUser = updateRepos(user, filteredRepos);
    });
  }

  void _setAlreadyFiltered() {
    setState(() {
      alreadyFiltered = !alreadyFiltered;
    });
  }

  void _resetUser() async {
    GithubUser user = await _futureGithubUser;
    this._setUser(user.login);
    this._setAlreadyFiltered();
  }

  void _filterRepos(String repo) async {
    GithubUser user = await _futureGithubUser;
    List<GithubRepos> filteredRepos =
        user.repos.where((value) => value.name.contains(repo)).toList();
    user.repos = filteredRepos;

    this._setRepos(user, filteredRepos);
    this._setAlreadyFiltered();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();

    if (_futureGithubUser == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Github Profiler')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                height: 300,
              ),
              Text(
                'Pesquise um usuário',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _popSearchBar(),
          child: Icon(Icons.search, color: Colors.white),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(title: Text('Github Profiler')),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Wrap(children: <Widget>[
            futureGithubUser(_futureGithubUser),
            futureGithubRepos(_futureGithubUser),
          ]),
        ),
        floatingActionButton: SpeedDialWidget(
          scrollController: _scrollController,
          popSearchBar: _popSearchBar,
          popFilterRepos: _popFilterRepos,
          alreadyFiltered: alreadyFiltered,
        ));
  }

  // Privados - Metodos para dar push em telas
  void _popSearchBar() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Procurar perfil'),
        ),
        body: TextField(
          autofocus: true,
          onSubmitted: (username) {
            this._setUser(username);
            Navigator.pop(context);
          },
          decoration: InputDecoration(
              hintText: 'Digite o nome do usuario que deseja buscar',
              contentPadding: const EdgeInsets.all(16.0)),
        ),
      );
    }));
  }

  void _popFilterRepos([bool alreadyFiltered]) {
    if (alreadyFiltered != null && alreadyFiltered) {
      this._resetUser();
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Filtrar Repos por nome'),
          ),
          body: TextField(
            autofocus: true,
            onSubmitted: (repos) {
              this._filterRepos(repos);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                hintText: 'Digite o nome do repo que deseja filtrar',
                contentPadding: const EdgeInsets.all(16.0)),
          ),
        );
      }));
    }
  }
}
