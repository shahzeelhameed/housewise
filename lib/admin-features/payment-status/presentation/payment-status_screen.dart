import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:housewise/data/app_url/app_url.dart';
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pdf/widgets.dart' as pw;

class PaymentStatusScreen extends StatefulWidget {
  const PaymentStatusScreen({super.key});

  @override
  _PaymentStatusScreenState createState() => _PaymentStatusScreenState();
}

class _PaymentStatusScreenState extends State<PaymentStatusScreen> {
  List<dynamic> users = [];
  Map<int, bool> expandedUser = {};
  Map<int, List<Map<String, dynamic>>> monthlyUsageByUser = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      final response =
          await http.get(Uri.parse("${AppUrl.BASE_URL}/water-usage-all"));
      if (response.statusCode == 200) {
        setState(() {
          users = json.decode(response.body);
          isLoading = false;
        });
      } else {
        showError("Failed to load data.");
      }
    } catch (e) {
      showError("An error occurred: $e");
    }
  }

  Future<void> fetchMonthlyUsage(int userId) async {
    try {
      final response = await http
          .get(Uri.parse("${AppUrl.BASE_URL}/water-usage-history/$userId"));
      if (response.statusCode == 200) {
        final List raw = json.decode(response.body);
        setState(() {
          monthlyUsageByUser[userId] = raw.map((item) {
            return {
              'month': item['usage_date'].substring(0, 7), // YYYY-MM
              'usage': item['volume']
            };
          }).toList();
        });
      } else {
        showError("Failed to load monthly usage.");
      }
    } catch (e) {
      showError("An error occurred: $e");
    }
  }

  Future<void> setBillAmount(int userId, String amount) async {
    try {
      final response = await http.post(
        Uri.parse("${AppUrl.BASE_URL}/water-usage/$userId/set-bill"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'payable_amount': amount}),
      );
      if (response.statusCode == 200) {
        fetchUsers();
        showSuccess("Bill amount updated successfully.");
      } else {
        showError("Failed to update bill amount.");
      }
    } catch (e) {
      showError("An error occurred: $e");
    }
  }

  Future<void> markAsPaid(int userId, String amount) async {
    try {
      final response = await http.post(
        Uri.parse("${AppUrl.BASE_URL}/water-usage/$userId/pay"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'paid_amount': amount}),
      );
      if (response.statusCode == 200) {
        fetchUsers();
        showSuccess("Marked as paid successfully.");
      } else {
        showError("Failed to mark as paid.");
      }
    } catch (e) {
      showError("An error occurred: $e");
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message, style: const TextStyle(color: Colors.red))),
    );
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message, style: const TextStyle(color: Colors.green))),
    );
  }

  Future<void> sendReminder(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('reminder_sent', true);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Reminder sent to $userName: Kindly pay your bill!',
          style: const TextStyle(color: Colors.orange),
        ),
      ),
    );
  }

  Future<void> generatePdfReport() async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Text('Water Usage Report',
              style: const pw.TextStyle(fontSize: 24)),
          pw.SizedBox(height: 20),
          ...users.map((user) => pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('Name: ${user['user_name']}'),
                  pw.Text('Flat No: ${user['flat_no']}'),
                  pw.Text('Overall Usage: ${user['overall_usage']} L'),
                  pw.Text('Monthly Usage: ${user['monthly_usage']} L'),
                  pw.Text('Payable Amount: \$${user['payable_amount']}'),
                  pw.Text('Paid: ${user['is_paid'] == 1 ? "Yes" : "No"}'),
                  pw.Divider(),
                ],
              )),
        ],
      ),
    );
    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }

  Widget buildMonthlyUsageTable(int userId) {
    final data = monthlyUsageByUser[userId] ?? [];

    if (data.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text("No monthly data available."),
      );
    }

    return Column(
      children: [
        const SizedBox(height: 10),
        Table(
          border: TableBorder.all(color: Colors.grey),
          children: [
            const TableRow(
              decoration: BoxDecoration(color: Colors.grey),
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Month',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Usage (L)',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            ...data.map((entry) => TableRow(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(entry['month'])),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${entry['usage']}')),
                  ],
                )),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Usage Summary"),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            tooltip: 'Generate PDF Report',
            onPressed: generatePdfReport,
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final int userId = user['user_id'];
                final TextEditingController billController =
                    TextEditingController();
                final TextEditingController paidAmountController =
                    TextEditingController();

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: ${user['user_name']}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Flat No: ${user['flat_no']}"),
                        Text("Overall Usage: ${user['overall_usage']}"),
                        Text("Monthly Usage: ${user['monthly_usage']}"),
                        Text("Payable Amount: ${user['payable_amount']}"),
                        Text(
                            "Payment Status: ${user['is_paid'] == 1 ? "Paid" : "Unpaid"}"),
                        Text("Current Flow Rate: ${user['current_flow_rate']}"),
                        const SizedBox(height: 10),
                        TextField(
                          controller: billController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: "Set Bill Amount",
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () =>
                              setBillAmount(userId, billController.text),
                          child: const Text("Set Bill"),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: paidAmountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              labelText: "Enter Paid Amount",
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () =>
                              markAsPaid(userId, paidAmountController.text),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: const Text("Mark as Paid"),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => sendReminder(user['user_name']),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange),
                          child: const Text("Send Reminder"),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              expandedUser[userId] =
                                  !(expandedUser[userId] ?? false);
                            });
                            if (expandedUser[userId] == true &&
                                !monthlyUsageByUser.containsKey(userId)) {
                              await fetchMonthlyUsage(userId);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent),
                          child: Text(expandedUser[userId] == true
                              ? "Hide Monthly Usage"
                              : "View Monthly Usage"),
                        ),
                        if (expandedUser[userId] == true)
                          buildMonthlyUsageTable(userId),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
