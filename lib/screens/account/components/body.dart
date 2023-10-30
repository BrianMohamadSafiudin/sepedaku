import 'package:sepedaku/components/backgroundAccount.dart';
import 'package:sepedaku/components/color.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:sepedaku/screens/account/components/profile.dart';
import 'package:sepedaku/screens/account/components/saveScan.dart';
import 'package:sepedaku/screens/account/components/scan.dart';
import 'package:sepedaku/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [BackgroundAccount(), HeaderBodyAccount()],
        ),
        SizedBox(height: size.height * 0.05),
        Container(
          height: size.height * 0.5,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: MenuAccount(),
        ),
      ],
    );
  }
}

class MenuAccount extends StatelessWidget {
  const MenuAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonAccount(
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfileScreen(),
                ));
          },
          icon: Icons.person,
          title: 'Edit Profile',
        ),
        SizedBox(height: 16),
        ButtonAccount(
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScanScreen(),
                ));
          },
          icon: Icons.qr_code_scanner,
          title: 'Scan SIM',
        ),
        SizedBox(height: 16),
        ButtonAccount(
          press: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaveScanScreen(),
                ));
          },
          icon: Icons.save,
          title: 'SIM Saved',
        ),
        Spacer(),
        RoundedButton(
            text: 'Logout',
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
            color: Color(0xffff0000),
            textColor: Colors.white,
            height: 40,
            width: 283),
      ],
    );
  }
}

class HeaderBodyAccount extends StatelessWidget {
  const HeaderBodyAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 45),
      height: size.height * 0.28,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Account",
              style: GoogleFonts.poppins(fontSize: 22, color: Colors.white),
            ),
            Container(
              height: 134,
              width: 134,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/cipung.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonAccount extends StatelessWidget {
  final void Function() press;
  final IconData icon;
  final String title;
  const ButtonAccount({
    super.key,
    required this.press,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          press();
        },
        style: ElevatedButton.styleFrom(
            fixedSize: Size.fromHeight(50), backgroundColor: primaryColor),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 8),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 18),
            )
          ],
        ));
  }
}