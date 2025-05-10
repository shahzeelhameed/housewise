import 'package:flutter/material.dart';

import 'package:housewise/data/app_url/app_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminCreateUser extends StatefulWidget {
  const AdminCreateUser({super.key});

  @override
  _AdminCreateUserState createState() => _AdminCreateUserState();
}

class _AdminCreateUserState extends State<AdminCreateUser> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  // final TextEditingController flatNoController = TextEditingController();

  String userType = "Domestic Supervisor"; // Default user type
  int isSuperAdmin = 2; // Default is_super_admin value for Domestic Supervisor

  void registerUser() async {
    final String url = "${AppUrl.BASE_URL}/register";

    Map<String, dynamic> body = {
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "password_confirmation": confirmPasswordController.text,
      "phone_no": phoneController.text,
      // "flat_no": flatNoController.text,
      "is_super_admin": isSuperAdmin,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 201) {
        // Success
        final data = jsonDecode(response.body);
        print("Registration successful: $data");
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Registration successful")));
      } else {
        // Error
        print("Error: ${response.body}");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Registration failed")));
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("An error occurred")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup Page"),
      ),
      // drawer: const adminNav(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              TextField(
                controller: confirmPasswordController,
                decoration:
                    const InputDecoration(labelText: "Confirm Password"),
                obscureText: true,
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "Phone Number"),
                keyboardType: TextInputType.phone,
              ),
              // TextField(
              //   controller: flatNoController,
              //   decoration: InputDecoration(labelText: "Flat Number"),
              // ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: userType,
                items: const [
                  DropdownMenuItem(
                    value: "Domestic Supervisor",
                    child: Text("Domestic Supervisor"),
                  ),
                  DropdownMenuItem(
                    value: "Admin",
                    child: Text("Admin"),
                  ),
                  // DropdownMenuItem(
                  //   value: "Other User Type",
                  //   child: Text("Other User Type"),
                  // ),
                ],
                onChanged: (value) {
                  setState(() {
                    userType = value!;
                    if (userType == "Domestic Supervisor") {
                      isSuperAdmin = 2;
                    } else if (userType == "Admin") {
                      isSuperAdmin = 1;
                    }
                    // else {
                    //   isSuperAdmin = 0; // Default for other user types
                    // }
                  });
                },
                decoration: const InputDecoration(labelText: "User Type"),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: registerUser,
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
