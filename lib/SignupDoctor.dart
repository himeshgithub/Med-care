import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'databaseDoctor.dart';
import 'LoginPage.dart';

class SignUpDoctor extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _email;
  String _password;
  String _name;
  String _degree;
  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final  _formKey=GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Medcare'),
        ),
        body: 
           Form(
            key:_formKey ,
          child:
          Padding(
            
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Med-Care',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator:(input){
                      if (input.isEmpty)
                      {
                        return 'Please Enter your Name';
                        
                      }
                      return null;
                    } ,
                    onSaved: (input)=>_name=input,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator:(input){
                      if (input.isEmpty)
                      {
                        return 'Please Enter your Degree Name';
                        
                      }
                      return null;
                    } ,
                    onSaved: (input)=>_degree=input,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Degree Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    validator:(input){
                      if (input.isEmpty)
                      {
                        return 'Please type an email';
                        
                      }
                      return null;
                    } ,
                    onSaved: (input)=>_email=input,
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    validator:(input){
                      if (input.length<6)
                      {
                        return 'Please provide password >=6 alphabets';
                      }
                      return null;
                    } ,
                    onSaved: (input)=>_password=input,
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
              Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Sign In'),
                      onPressed:()async
                      {
                        final formState =_formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
    
        AuthResult res = await _firebaseAuth.createUserWithEmailAndPassword(email: _email, password: _password);
        FirebaseUser user=res.user;
        await DatabaseServiceDoctor(uid: user.uid).updateUserData(_name, _degree);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Sign_in()));
      }catch(e){
        print(e.message);
      }
    }
    
                      }
                    )),
      ]))));
  }


}  
