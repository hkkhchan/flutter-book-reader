import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'auth.dart';
class SignUpPage extends StatefulWidget {
  SignUpPage({this.auth});
  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email = "";
  String _password = "";
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _SignUpPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildBar(context),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: _buildForm(context)
      )
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Sign Up"),
      centerTitle: true,
    );
  }

  Widget _buildForm(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildTextFields(),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildTextFields() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              onSaved: (value)=> _email = value,
              validator: (value) => value.isEmpty ? 'Email can\'t be empty': null
            ),
          ),
          Container(
            child: TextFormField(
              decoration: InputDecoration(
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
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('Create an Account'),
            onPressed: _createAccountPressed,
          ),
          FlatButton(
            child: Text('Have an account? Click here to login.'),
            onPressed: _goLogin,
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
        var uid = await widget.auth.createUserWithEmailAndPassword(_email, _password);
        print('User created: $uid');
      } catch(e){
        print('Error:' + e);
      }
    }
  }

  void _goLogin(){
    Navigator.pushNamed(context, '/login');
  }

}