import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  String _email = "";
  final _formKey = GlobalKey<FormState>();

  _ForgetPasswordPageState();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildEmailFields(),
            _buildSendButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Forget Password"),
      centerTitle: true,
    );
  }

  Widget _buildEmailFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Form(
            key: _formKey,
            child: new TextFormField(
              decoration: new InputDecoration(
                labelText: 'Email',
              ),
              onSaved: (value)=> _email = value,
              validator: (value) => value.isEmpty ? 'Email can\'t be empty': null
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendButtons() {
    return new Container(
      padding: EdgeInsets.only(top: 15.0),
      child: new RaisedButton(
        child: new Text('Send'),
        onPressed: _sendPressed,
      ),
    );
  }

  void _sendPressed () async{
    final form = _formKey.currentState;
    if(form.validate()){
      form.save();
      print('The user wants to send forget password with $_email');
      Future future = Future.delayed(Duration(seconds: 3),(){
        return FirebaseAuth.instance.fetchSignInMethodsForEmail(email: _email);
      });
      try{
        await future;
        _showDialog('success');
      } catch(e){
        print('Error: $e');
        _showDialog('not-found');
      }
    }
  }

  void _showDialog(String msg){
    String title = '';
    if (msg == 'success'){
      title = 'Success';
      msg = 'Please check email for reset password';
    } else {
      title = 'Failed';
    }
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text('close'),
              onPressed: (){Navigator.of(context).pop();},
            )
          ]
        );
      }
    );
  }

}