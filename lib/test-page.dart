import 'package:flutter/material.dart';
import 'auth.dart';

class TestPage extends StatefulWidget {
  const TestPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => _TestPageState('header');
}

class _TestPageState extends State<TestPage> {
  String _title = '';
  _TestPageState(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Column(children: <Widget>[
        _buildImage(context),
        _buildText(context)
      ],)
    );
  }

  Widget _buildBar(BuildContext context){
    return AppBar(
      title: Text(_title),
      centerTitle: true,
    );
  }

  Widget _buildImage(BuildContext context){
    AssetImage assetImage = AssetImage('images/book.png');
    return Container(
        margin: const EdgeInsets.only(top: 100.0),
        child:Center(
          child:Image(image: assetImage)
        )
    );
  }

  Widget _buildText(BuildContext context){
    String email = 'null string';
    return Text(email);
  }


}