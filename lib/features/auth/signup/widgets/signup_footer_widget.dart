import 'package:flutter/material.dart';
import 'package:housewise/config/routes/routes.dart';
import 'package:housewise/config/routes/routes_name.dart';
import 'package:housewise/constants/image_strings.dart';
import 'package:housewise/constants/sizes.dart';
import 'package:housewise/constants/text_strings.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        const SizedBox(
          height: vFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(vGoogleLogoImage),
              width: 20.0,
            ),
            label: Text(vSignInWithGoogle.toUpperCase()),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.LOGIN);
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: vAlreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            TextSpan(
              text: vLogin.toUpperCase(),
              style: const TextStyle(color: Colors.blue),
            )
          ])),
        )
      ],
    );
  }
}
