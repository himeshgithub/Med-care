  
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServicePatient {

  final String uid;
  DatabaseServicePatient({ this.uid });

  // collection reference
  final CollectionReference PatientCollection = Firestore.instance.collection('Patient');

  Future<void> updateUserData(String name, String age) async {
    return await PatientCollection.document(uid).setData({
      
      'name': name,
      'age': age,
    });
  }

}