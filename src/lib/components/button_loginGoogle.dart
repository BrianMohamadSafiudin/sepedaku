import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sepedaku/components/locale/locale_keys.g.dart';
import 'package:sepedaku/screens/dashboard/dashboard_screen.dart';

class ButtonLoginGoogle extends StatelessWidget {
  ButtonLoginGoogle({Key? key}) : super(key: key);

  void signInWithGoogle(BuildContext context) async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken, 
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user?.displayName);

    if (userCredential.user != null) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DashboardScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        signInWithGoogle(context); // Pass the context here
      },
      icon: SvgPicture.asset("assets/icons/google.svg"),
      label: Text(
        LocaleKeys.loginwithgoogle,
        style: GoogleFonts.poppins(color: Colors.black),
      ).tr(),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(8)),
          fixedSize: Size(305, 50)),
    );
  }
}
