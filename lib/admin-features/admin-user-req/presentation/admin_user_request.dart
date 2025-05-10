import 'dart:convert';

import 'package:housewise/data/app_url/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminUserRequest extends StatefulWidget {
  const AdminUserRequest({super.key});

  @override
  _AdminUserRequestState createState() => _AdminUserRequestState();
}

class _AdminUserRequestState extends State<AdminUserRequest> {
  List<dynamic> users = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('Token');

    try {
      final response = await http.get(
        Uri.parse('${AppUrl.BASE_URL}/unapproved'),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        setState(() {
          users = json.decode(response.body);
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> approveUser(int userId) async {
    try {
      final response = await http.post(
        Uri.parse('${AppUrl.BASE_URL}/users/approve/$userId'),
      );

      if (response.statusCode == 200) {
        setState(() {
          users = users.map((user) {
            if (user['id'] == userId) {
              user['is_approved'] = 1;
            }
            return user;
          }).toList();
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('User approved successfully!'),
          backgroundColor: Colors.green,
        ));
      } else {
        throw Exception('Failed to approve user');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error approving user'),
        backgroundColor: Colors.red,
      ));
      print(e);
    }
  }

  Future<void> deleteUser(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('Token');

    try {
      final response = await http.delete(
        Uri.parse('${AppUrl.BASE_URL}/users/$userId'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        setState(() {
          users = users.where((user) => user['id'] != userId).toList();
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('User deleted successfully!'),
          backgroundColor: Colors.green,
        ));
      } else {
        throw Exception('Failed to delete user');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error deleting user'),
        backgroundColor: Colors.red,
      ));
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : users.isEmpty
              ? const Center(child: Text('No users found'))
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(user['name']),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email: ${user['email']}'),
                            Text('Phone: ${user['phone_no']}'),
                            Text('Flat No: ${user['flat_no']}'),
                            Text(
                              'Approved: ${user['is_approved'] == 1 ? 'Yes' : 'No'}',
                              style: TextStyle(
                                color: user['is_approved'] == 1
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            user['is_approved'] == 1
                                ? const Icon(Icons.check, color: Colors.green)
                                : ElevatedButton(
                                    onPressed: () {
                                      approveUser(user['id']);
                                    },
                                    child: const Text('Approve'),
                                  ),
                            const SizedBox(width: 10),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Delete User'),
                                    content: const Text(
                                        'Are you sure you want to delete this user?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          deleteUser(user['id']);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
