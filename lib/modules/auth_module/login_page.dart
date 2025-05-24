

import 'package:fliq_dating_app/common_widgets/button_one.dart';
import 'package:fliq_dating_app/common_widgets/privacy_and_terms.dart';
import 'package:fliq_dating_app/modules/auth_module/phone_number_page.dart';
import 'package:fliq_dating_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/image.png', fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                Image.asset('assets/icon/fliq.png', height: 50),
                const SizedBox(height: 16),
                Text(
                  "Connect. Meet. Love.\nWith Fliq Dating",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: appColor(context).ternaryText, fontSize: 25, fontWeight: FontWeight.w900),
                ),
                Spacer(),
                ButtonOne(
                  title: "Sign in with Google",
                  backgroundColor: appColor(context).ternaryText!,
                  textColor: appColor(context).primaryText!,
                  leading: Image.asset('assets/icon/google.png', height: 20),
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                ButtonOne(
                  title: "Sign in with Facebook",
                  backgroundColor: appColor(context).text!,
                  leading: Image.asset('assets/icon/fb.png', height: 20),
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                ButtonOne(
                  title: "Sign in with phone number",
                  backgroundColor: appColor(context).primary!,
                  leading: Image.asset('assets/icon/call.png', height: 20),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const PhoneNumberPage()));
                  },
                ),
                const SizedBox(height: 24),
                PrivacyAndTermsText(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
