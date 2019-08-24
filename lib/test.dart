import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key key}): super(key: key);
  @override
  State<StatefulWidget> createState() => _TestPageState('header');
}

class _TestPageState extends State<TestPage> {
  String _title = '';
  _TestPageState(this._title);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: Column(children: <Widget>[
        RaisedButton(
          child: Text('Login'),
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/login');
          },
        ),
        RaisedButton(
          child: Text('Signup'),
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/signup');
          },
        ),
      ],)
    );
  }

  Widget _buildBar(BuildContext context){
    return new AppBar(
      title: new Text(_title),
      centerTitle: true,
    );
  }

}