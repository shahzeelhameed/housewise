import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:housewise/data/app_url/app_url.dart';
import 'package:http/http.dart' as http;

// const String baseUrl = "http://your-api-endpoint.com"; // Replace with your API URL

class AdminWaterUsageScreen extends StatefulWidget {
  const AdminWaterUsageScreen({super.key});

  @override
  _AdminWaterUsageScreenState createState() => _AdminWaterUsageScreenState();
}

class _AdminWaterUsageScreenState extends State<AdminWaterUsageScreen> {
  List<dynamic> waterUsageData = [];
  double totalWaterUsed = 0.0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) fetchWaterUsageData();
    });
  }

  Future<void> fetchWaterUsageData() async {
    try {
      final response =
          await http.get(Uri.parse("${AppUrl.BASE_URL}/water-usage-all"));
      if (response.statusCode == 200) {
        setState(() {
          waterUsageData = json.decode(response.body);
          totalWaterUsed = waterUsageData.fold(
              0.0,
              (sum, user) =>
                  sum + double.parse(user['overall_usage'].toString()));
          print(waterUsageData);
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Usage'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Water Used: ${totalWaterUsed.toStringAsFixed(2)} liters',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: waterUsageData.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: waterUsageData.length,
                    itemBuilder: (context, index) {
                      final user = waterUsageData[index];
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          title: Text(user['user_name']),
                          subtitle: Text('Flat No: ${user['flat_no']}'),
                          trailing: Text(
                              'Usage: ${double.parse(user['overall_usage'].toString()).toStringAsFixed(2)}'),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Name: ${user['user_name']}, Flat No: ${user['flat_no']}'),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
