import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  final CollectionReference userData =
      FirebaseFirestore.instance.collection('userdata');

  // Add user data
  Future<void> addUser( {
      required String user,required String email, required String address, required String phone, required String userImage}) {
    return userData.add({
      'user': user,
      'email': email,
      'phone': phone,
      'userimage': userImage,
      'address':address,
      
    });
  }

  // Edit user data
  Future<void> editUser(String userId, String user, String email, String phone,
      String userImage) {
    return userData.doc(userId).update({
      'user': user,
      'email': email,
      'phone': phone,
      'userimage': userImage,
    });
  }

  // Delete user data
  Future<void> deleteUser(String userId) {
    return userData.doc(userId).delete();
  }
}

Future<UserData> getUserData(String userId) async {
  DocumentSnapshot doc =
      await FirebaseFirestore.instance.collection('userdata').doc(userId).get();

  return UserData.fromDocument(doc);
}

class UserData {
  String id;

  String username;

  String email;

  String userImage;

  UserData(
      {required this.id,
      required this.username,
      required this.email,
      required this.userImage});

  factory UserData.fromDocument(DocumentSnapshot doc) {
    return UserData(
      id: doc.id,
      username: doc['user'],
      email: doc['email'],
      userImage: doc['userimage'],
    );
  }
}


// Display the username and email in the user profile

// UserData userData = await getUserData(userId);

// Text(userData.username),

// Text(userData.email),