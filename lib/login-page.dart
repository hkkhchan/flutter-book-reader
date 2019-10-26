import 'package:flutter/material.dart';
import 'auth.dart';
import 'lang.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth});

  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";
  Locale locale;
  final _formKey = GlobalKey<FormState>();

  _LoginPageState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  bool validAndSave(){
    final form = _formKey.currentState;
    if (form.validate()){
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void _loginPressed() async{
    if (validAndSave()){
      try{
        var uid = await widget.auth.signInWithEmailAndPassword(_email, _password);
        print('Sign in: $uid');
        _goText();
      } catch(e){
        print('error: $e');
      }
    }
  }

  void _goSignup(){
    Navigator.pushNamed(context, '/signup');
  }

  void _goForgetPassword(){
    Navigator.pushNamed(context, '/forget-password');
  }

  void _goText(){
    Navigator.pushNamed(context, '/test');
  }

  Widget _buildBar(BuildContext context){
    return new AppBar(
      title: new Text(Lang.of(context).text('login')),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            new Container(
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: 'Email'
                ),
                onSaved: (value)=> _email = value,
                validator: (value) => value.isEmpty ? 'Email can\'t be empty': null 
              ),
            ),
            new Container(
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: 'Password'
                ),
                obscureText: true,
                onSaved: (value) => _password = value,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
      return new Container(
        padding: EdgeInsets.only(top: 15.0),
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: _loginPressed,
            ),
            new FlatButton(
              child: new Text('Dont have an account? Tap here to register.'),
              onPressed: _goSignup,
            ),
            new FlatButton(
              child: new Text('Forgot Password?'),
              onPressed: _goForgetPassword,
            )
          ],
        ),
      );
  }

}