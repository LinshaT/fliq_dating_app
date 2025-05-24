import 'package:fliq_dating_app/common_widgets/button_one.dart';
import 'package:fliq_dating_app/common_widgets/input_phone.dart';
import 'package:fliq_dating_app/modules/auth_module/otp_page.dart';
import 'package:fliq_dating_app/providers/auth_provider.dart';
import 'package:fliq_dating_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PhoneNumberPage extends ConsumerStatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  ConsumerState<PhoneNumberPage> createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends ConsumerState<PhoneNumberPage> {
  String fullPhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Enter your phone \nnumber",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: appColor(context).primaryText),
              ),
            ),
            const SizedBox(height: 24),
            Inputphone(
              onChanged: (value) {
                fullPhoneNumber = value;
              },
            ),
            const SizedBox(height: 8),
            Text(
              "Fliq will send you a text with a verification code.",
              style: TextStyle(fontSize: 12, color: appColor(context).primaryText, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            ButtonOne(
              title: "Next",
              backgroundColor: appColor(context).primary!,
              gradientColors: appColor(context).primaryGradient!,
              onTap: () async {
                ref.read(phoneProvider.notifier).state = fullPhoneNumber;
                final sent = await ref.read(otpRequestProvider(fullPhoneNumber).future);
                if (sent) {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpPage()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("OTP failed")));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
