import 'package:sepedaku/components/form_inputEemail.dart';
import 'package:sepedaku/components/form_inputPassword.dart';
import 'package:sepedaku/components/form_inputText.dart';
import 'package:sepedaku/components/rounded_button.dart';
import 'package:sepedaku/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class FormRegister extends StatelessWidget {
  const FormRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: size.height * 0.52,
        child: Column(
          children: [
            FormInputText(
                label: "Username", hintText: "Masukkan Username Anda..."),
            SizedBox(height: 20),
            FormInputEmail(),
            SizedBox(height: 20),
            FormInputPassword(label: "Password"),
            SizedBox(height: 20),
            FormInputPassword(label: "Confirm Password"),
            Spacer(),
            RoundedButton(
                text: "Sign Up",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                color: Color(0xff1F41BB),
                textColor: Colors.white,
                height: 60,
                width: 357),
          ],
        ),
      ),
    );
  }
}