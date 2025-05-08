import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:housewise/config/routes/routes_name.dart';

import 'package:housewise/constants/sizes.dart';
import 'package:housewise/constants/text_strings.dart';
import 'package:housewise/data/app_url/app_url.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      padding: const EdgeInsets.symmetric(vertical: vFormHeight - 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: vEmail,
                hintText: vEmail,
                border: OutlineInputBorder()),
          ),
          const SizedBox(height: vFormHeight - 20),
          TextFormField(
            controller: passwordController,
            obscuringCharacter: "*",
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.fingerprint),
              labelText: vPassword,
              hintText: vPassword,
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible; // Toggle visibility
                  });
                },
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
          const SizedBox(height: vFormHeight - 20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  // ForgetPasswordScreen.buildShowModalBottomSheet(context);
                },
                child: const Text(
                  vForgetPassword,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                )),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  loginUser(context, emailController.text.toString(),
                      passwordController.text.toString());
                },
                child: Text(vLogin.toUpperCase())),
          )
        ],
      ),
    ));
  }

  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Response response = await post(
        Uri.parse('${AppUrl.BASE_URL}/login'),
        body: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        // Access data from response
        final user = json['user'];
        final isSuperAdmin = json['is_super_admin'];
        final isApproved = user['is_approved'];
        final bearerToken = json['token'];

        print("User Type (Super Admin): $isSuperAdmin");
        print("User Approval Status: $isApproved");

        // Save token and user type to SharedPreferences
        prefs.setString('Token', bearerToken);
        prefs.setInt('userType', isSuperAdmin);

        // Navigate based on user type and approval status
        // if (isSuperAdmin == 1) {
        //   Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => const NoticeManagementScreen()),
        //     (route) => false,
        //   );
        //   return; // Exit the function after navigating
        // }

        // if (isSuperAdmin == 2) {
        //   Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => const Domestichome()),
        //     (route) => false,
        //   );
        //   return; // Exit the function after navigating
        // }

        if (isSuperAdmin == 0 && isApproved == 1) {
          Navigator.pushNamed(context, RoutesName.BOTTOM_NAVIGATION);
          return; // Exit the function after navigating
        }
      } else {
        final json = jsonDecode(response.body);
        final message = json['message'];
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text("User is not approved.")),
    // );
  }
}
