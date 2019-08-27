import 'package:flutter/material.dart';
import 'auth.dart';
class SignupPage extends StatefulWidget {
  SignupPage({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email = "";
  String _password = "";
  GlobalKey<FormState> _formKey;

  _SignupPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Sign Up"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextFormField(
              decoration: new InputDecoration(
                labelText: 'Email',
              ),
              onSaved: (value)=> _email = value,
              validator: (value) => value.isEmpty ? 'Email can\'t be empty': null
            ),
          ),
          new Container(
            child: new TextFormField(
              decoration: new InputDecoration(
                labelText: 'Password',
              ),
              onSaved: (value)=> _password = value,
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      padding: EdgeInsets.only(top: 15.0),
      child: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text('Create an Account'),
            onPressed: _createAccountPressed,
          ),
          new FlatButton(
            child: new Text('Have an account? Click here to login.'),
            onPressed: (){
              Navigator.pushNamed(context, '/login');
            },
          )
        ],
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

  void _createAccountPressed () async {
    if(validAndSave()){
      try{
        var uid = await widget.auth.signInWithEmailAndPassword(_email, _password);
        print('Sign in: $uid');
      } catch(e){
        print('error: $e');
      }
    }
  }

}