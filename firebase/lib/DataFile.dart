import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();


class DataManage extends StatefulWidget {
  const DataManage({Key? key}) : super(key: key);

  @override
  State<DataManage> createState() => _DataManageState();
}

class _DataManageState extends State<DataManage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Community Board'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => gSignin(),

              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
              // padding: EdgeInsets.all(0.0),
              child: Ink(
                color: Colors.blue,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 200.0,
                    maxHeight: 50.0,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "google sign in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                // padding: EdgeInsets.all(0.0),
                child: Ink(
                  color: Colors.blue,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 200.0,
                      maxHeight: 50.0,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "sign in with Email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => createAcc(),
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
              // padding: EdgeInsets.all(0.0),
              child: Ink(
                color: Colors.blue,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 200.0,
                    maxHeight: 50.0,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Create Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        ),
    );
  }

    Future<UserCredential> gSignin() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser
          ?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      var username = await googleUser?.displayName;
      var phourl = await googleUser?.photoUrl;

      print('user name :---$username');
      print('phourl :---$phourl');
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

  Future createAcc() async{
    final GoogleSignInAccount? googleUser = await _auth.createUserWithEmailAndPassword(email: "vadoliyanidhi5@gmail.com", password: "123456789").then((pragma){
     // print('user name ${googleUser?.displayName}');
    });

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser
        ?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

  }
}
