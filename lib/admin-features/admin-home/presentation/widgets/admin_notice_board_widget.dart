import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/data/app_url/app_url.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NoticeManagementScreen extends StatefulWidget {
  const NoticeManagementScreen({super.key});
  @override
  _NoticeManagementScreenState createState() => _NoticeManagementScreenState();
}

class _NoticeManagementScreenState extends State<NoticeManagementScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  List<Notice> _notices = [];
  bool _isEditing = false;
  int? _editingNoticeId;

  final String apiBaseUrl = "${AppUrl.BASE_URL}/notice-board";

  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _fetchNotices();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('Token');
  }

  Future<void> _fetchNotices() async {
    final token = await _getToken();
    if (token == null) return;
    final url = Uri.parse(apiBaseUrl);

    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _notices = data.map((json) => Notice.fromJson(json)).toList();
        });
        _animController.forward(from: 0);
      }
    } catch (e) {
      print('Error fetching notices: $e');
    }
  }

  Future<void> _createOrUpdateNotice() async {
    final token = await _getToken();
    if (token == null) return;

    final payload = {
      'title': _titleController.text,
      'content': _contentController.text,
    };

    try {
      final response = _isEditing
          ? await http.put(
              Uri.parse('$apiBaseUrl/$_editingNoticeId'),
              body: jsonEncode(payload),
              headers: {
                'Authorization': 'Bearer $token',
                'Content-Type': 'application/json',
              },
            )
          : await http.post(
              Uri.parse(apiBaseUrl),
              body: jsonEncode(payload),
              headers: {
                'Authorization': 'Bearer $token',
                'Content-Type': 'application/json',
              },
            );

      if (response.statusCode == 200 || response.statusCode == 201) {
        _fetchNotices();
        _resetForm();
      }
    } catch (e) {
      print('Error creating/updating notice: $e');
    }
  }

  Future<void> _deleteNotice(int id) async {
    final token = await _getToken();
    if (token == null) return;

    try {
      final response = await http.delete(
        Uri.parse('$apiBaseUrl/$id'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _notices.removeWhere((notice) => notice.id == id);
        });
      }
    } catch (e) {
      print('Error deleting notice: $e');
    }
  }

  void _resetForm() {
    setState(() {
      _isEditing = false;
      _editingNoticeId = null;
      _titleController.clear();
      _contentController.clear();
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      buildGradientTitle(_isEditing ? "Edit Notice" : "Create Notice"),
      const SizedBox(height: 12),
      buildFormCard(),
      const SizedBox(height: 20),
      buildGradientTitle("📰 Notices"),
      const SizedBox(height: 12),
      buildNoticeList(),
    ]);
  }

  Widget buildGradientTitle(String title) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [AppColor.secondary, AppColor.primary],
      ).createShader(bounds),
      child: Text(title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  Widget buildFormCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
        boxShadow: [
          BoxShadow(color: Colors.white.withOpacity(0.1), blurRadius: 10),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            controller: _titleController,
            style: const TextStyle(color: Colors.white),
            decoration: inputDecoration("Title"),
            validator: (v) => v == null || v.isEmpty ? 'Enter a title' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _contentController,
            style: const TextStyle(color: Colors.white),
            decoration: inputDecoration("Content"),
            validator: (v) => v == null || v.isEmpty ? 'Enter content' : null,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) _createOrUpdateNotice();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(_isEditing ? "Update Notice" : "Add Notice"),
            ),
          )
        ]),
      ),
    );
  }

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.cyanAccent),
      filled: true,
      fillColor: Colors.white12,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.cyanAccent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white30),
      ),
    );
  }

  Widget buildNoticeList() {
    if (_notices.isEmpty) {
      return const Text("No notices yet.",
          style: TextStyle(color: Colors.white60));
    }

    return ListView.builder(
      itemCount: _notices.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, i) {
        final notice = _notices[i];
        return AnimatedBuilder(
          animation: _animController,
          builder: (context, _) {
            return FadeTransition(
              opacity: _animController,
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.deepPurple.shade900, Colors.black],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.purple.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 1)
                  ],
                ),
                child: ListTile(
                  title: Text(notice.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16)),
                  subtitle: Text(notice.content,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 14)),
                  trailing: Wrap(
                    spacing: 10,
                    children: [
                      IconButton(
                          icon: const Icon(Icons.edit, color: Colors.teal),
                          onPressed: () {
                            setState(() {
                              _isEditing = true;
                              _editingNoticeId = notice.id;
                              _titleController.text = notice.title;
                              _contentController.text = notice.content;
                            });
                          }),
                      IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteNotice(notice.id)),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Notice {
  final int id;
  final String title;
  final String content;
  final bool isActive;

  Notice({
    required this.id,
    required this.title,
    required this.content,
    required this.isActive,
  });

  // Factory constructor to create a Notice from JSON
  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      isActive: json['is_active'] == 1, // Convert 1/0 to true/false
    );
  }
}
