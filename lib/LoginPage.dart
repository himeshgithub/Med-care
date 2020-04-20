import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import  'signup_options.dart';
import 'home.dart';

class Sign_in extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _email;
  String _password;
  
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
                      'Welcome to med-care',
                      style: TextStyle(fontSize: 20),
                    )),
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
                      labelText: 'User Name',
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
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password'),
                ),
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () async
                      {
                        final formState =_formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
    
        AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: _email, password: _password);
        
        FirebaseUser user = result.user;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
        
      }catch(e){
        print(e.message);
      }
    }
                      }

                    )),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Does not have account?'),
                      FlatButton(
                        textColor: Colors.blue,
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed:(){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupOptions()));

                        } 
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            ))));
  }


}