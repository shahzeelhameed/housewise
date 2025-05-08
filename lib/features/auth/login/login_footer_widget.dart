import 'package:flutter/material.dart';
import 'package:housewise/config/routes/routes_name.dart';
import 'package:housewise/constants/image_strings.dart';
import 'package:housewise/constants/sizes.dart';
import 'package:housewise/constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: vFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(vGoogleLogoImage),
              width: 20.0,
            ),
            onPressed: () {},
            label: const Text(vSignInWithGoogle),
          ),
        ),
        const SizedBox(
          height: vFormHeight - 20,
        ),
        TextButton(
          onPressed: () => {Navigator.pushNamed(context, RoutesName.SIGNUP)},
          child: Text.rich(
            TextSpan(
                text: vDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(
                    text: vSignup,
                    style: TextStyle(color: Colors.blue),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
