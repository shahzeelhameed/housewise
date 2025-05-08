import 'package:flutter/material.dart';
import 'package:housewise/constants/image_strings.dart';
import 'package:housewise/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(vWelcomeScreenImage),
          height: size.height * 0.2,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Text(vLoginTitle, style: Theme.of(context).textTheme.displayLarge),
        Text(vLoginSubTitle, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
