import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = "";
  String _password = "";
  final _formKey = GlobalKey<FormState>();

  _LoginPageState();

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

  void _submit() async{
    if (validAndSave()){
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        print('Sign in: ${user.uid}');
      } catch(e){
        print('error: $e');
      }
    }
    print('The user wants to login with $_email and $_password');
  }

  void _goSignup(){
    Navigator.pushNamed(context, '/signup');
  }

  void _goForgetPassword(){
    Navigator.pushNamed(context, '/forget-password');
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Login"),
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
              onPressed: _submit,
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