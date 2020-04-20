  
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServiceDoctor {

  final String uid;
  DatabaseServiceDoctor({ this.uid });

  // collection reference
  final CollectionReference DoctorCollection = Firestore.instance.collection('Doctor');

  Future<void> updateUserData(String name, String degree) async {
    return await DoctorCollection.document(uid).setData({
      
      'name': name,
      'degree': degree,
    });
  }

}