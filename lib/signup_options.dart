import 'package:flutter/material.dart';
import 'SignupPatient.dart';
import 'SignupDoctor.dart';


class SignupOptions extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Med-Care'),
        ),
      body: 

          Padding(
            
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Signup Details',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'You are a ?',
                      style: TextStyle(fontSize: 40),
                    )),
                
                Container(
                  height: 60,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Doctor',style: TextStyle(fontSize: 30)),

                      onPressed: () async
                      {
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpDoctor())); 
                      }
                      

                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'OR',
                      style: TextStyle(fontSize: 20),
                    )),
                



                Container(
                  height: 60,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Patient',style: TextStyle(fontSize: 30)),
                      onPressed: () async
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPatient()));
                      }
                      

                    )),
                
              ],
            ))
    );
}
}