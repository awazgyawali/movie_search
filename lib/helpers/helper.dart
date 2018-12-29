import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as Im;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class FirebaseHelper {
  static final FirebaseHelper _singleton = FirebaseHelper._internal();

  factory FirebaseHelper() {
    return _singleton;
  }

  FirebaseHelper._internal();

  SharedPreferences _preferences;
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser user;
  var _verification;

  init() async {
    _preferences = await SharedPreferences.getInstance();
    return user = await _auth.currentUser();
  }

  Future loginWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    GoogleSignInAccount account = await _googleSignIn.signIn();
    GoogleSignInAuthentication authentication = await account.authentication;

    user = await _auth.signInWithGoogle(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);
    return user;
  }

  Future loginWithFacebook() async {
    var result = await FacebookLogin().logInWithReadPermissions(['email']);
    if (result.status == FacebookLoginStatus.loggedIn) {
      user =
          await _auth.signInWithFacebook(accessToken: result.accessToken.token);
      return user;
    } else if (result.status == FacebookLoginStatus.error)
      throw PlatformException(code: "ERROR", message: result.errorMessage);
    else
      return null;
  }

  loginWithPhoneNumber(phone, Function onSent, Function onFailed) async {
    _auth.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (id, [data]) {
        _verification = id;
        onSent();
      },
      verificationCompleted: (user) {
        this.user = user;
      },
      timeout: Duration(seconds: 60),
      codeAutoRetrievalTimeout: (data) {},
      verificationFailed: (e) {
        onFailed();
      },
    );
  }

  verifySMSCode(code) {
    return _auth.signInWithPhoneNumber(
        verificationId: _verification, smsCode: code);
  }

  Future logout() async {
    if (user != null) {
      await _auth.signOut();
      await init();
    }
  }

  Future<File> compressImage(file) async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    int rand = new Random().nextInt(10000);

    Im.Image image = Im.decodeImage(file.readAsBytesSync());
    Im.Image smallerImage = Im.copyResize(image, 300);

    return File('$path/img_$rand.jpg')
      ..writeAsBytesSync(Im.encodeJpg(smallerImage, quality: 80));
  }

  String _randomString(int length) {
    var rand = new Random();
    var codeUnits = new List.generate(length, (index) {
      return rand.nextInt(33) + 89;
    });

    return new String.fromCharCodes(codeUnits);
  }
}
