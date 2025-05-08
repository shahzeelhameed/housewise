import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:housewise/config/routes/routes_name.dart';
import 'package:housewise/constants/sizes.dart';
import 'package:housewise/constants/text_strings.dart';
import 'package:housewise/data/app_url/app_url.dart';
import 'package:http/http.dart' as http;

class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({
    super.key,
  });
  final emailController = TextEditingController();
  final name = TextEditingController();
  final passwordController = TextEditingController();
  final c_passwordController = TextEditingController();
  final phone_no = TextEditingController();
  final flat_no = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: vFormHeight - 10),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              label: Text(vFullName),
              prefixIcon: Icon(Icons.person_outline_rounded),
            ),
          ),
          const SizedBox(height: vFormHeight - 20),
          TextFormField(
            controller: flat_no,
            decoration: const InputDecoration(
              label: Text(vFlatNo),
              prefixIcon: Icon(Icons.numbers_sharp),
            ),
          ),
          const SizedBox(height: vFormHeight - 20),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              label: Text(vEmail),
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: vFormHeight - 20),
          TextFormField(
            controller: phone_no,
            decoration: const InputDecoration(
              label: Text(vPhoneNo),
              prefixIcon: Icon(Icons.numbers),
            ),
          ),
          const SizedBox(height: vFormHeight - 20),
          TextFormField(
            obscureText: true,
            obscuringCharacter: "*",
            controller: passwordController,
            decoration: const InputDecoration(
              label: Text(vPassword),
              prefixIcon: Icon(Icons.fingerprint),
            ),
          ),
          const SizedBox(height: vFormHeight - 10),
          TextFormField(
            obscureText: true,
            obscuringCharacter: "*",
            controller: c_passwordController,
            decoration: const InputDecoration(
              label: Text(vPassword),
              prefixIcon: Icon(Icons.fingerprint),
            ),
          ),
          const SizedBox(height: vFormHeight - 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                registerUser(context);
              },
              child: Text(vSignup.toUpperCase()),
            ),
          )
        ],
      )),
    );
  }

  Future<void> registerUser(BuildContext context) async {
    String apiUrl = '${AppUrl.BASE_URL}/register'; // Replace with your API URL

    // Prepare the registration data
    final Map<String, String> userData = {
      'name': name.text.toString(),
      'email': emailController.text.toString(),
      'password': passwordController.text.toString(),
      'password_confirmation': c_passwordController.text.toString(),
      'phone_no': phone_no.text.toString(),
      'flat_no': flat_no.text.toString(),
    };

    try {
      // Send the POST request to the /register endpoint
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(userData),
      );

      // Check the status code of the response
      if (response.statusCode == 201) {
        // User registered successfully
        print('User registered successfully');
        Navigator.pushNamed(context, RoutesName.LOGIN);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Signup Successul")));
        // Optionally, you can parse the response if needed:
        // final responseData = json.decode(response.body);
      } else {
        // Registration failed
        print('Failed to register user: ${response.body}');
      }
    } catch (error) {
      print('Error occurred during registration: $error');
    }
  }
}
