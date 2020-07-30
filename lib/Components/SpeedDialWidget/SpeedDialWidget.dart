import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialWidget extends StatefulWidget {
  final Function popSearchBar;
  final Function popFilterRepos;
  final ScrollController scrollController;
  final bool alreadyFiltered;

  const SpeedDialWidget(
      {Key key,
      this.scrollController,
      this.popSearchBar,
      this.popFilterRepos,
      this.alreadyFiltered})
      : super(key: key);

  @override
  _SpeedDialState createState() => _SpeedDialState();
}

class _SpeedDialState extends State<SpeedDialWidget> {
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.search, color: Colors.white),
          onTap: () => widget.popSearchBar(),
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
        ),
        _filterOption(),
        SpeedDialChild(
          child: Icon(Icons.arrow_upward, color: Colors.white),
          onTap: () => _scrollToTop(widget.scrollController),
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  void _scrollToTop(ScrollController scrollController) {
    scrollController.animateTo(0.0,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  SpeedDialChild _filterOption() {
    return widget.alreadyFiltered
        ? SpeedDialChild(
            child: Icon(Icons.close, color: Colors.white),
            onTap: () => widget.popFilterRepos(true),
            labelWidget: Text('Remover filtro'),
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
          )
        : SpeedDialChild(
            child: Icon(Icons.filter_list, color: Colors.white),
            onTap: () => widget.popFilterRepos(),
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
          );
  }
}
