import 'package:flutter/material.dart';
import 'package:housewise/admin-components/request_card.dart';

class ComplainsList extends StatefulWidget {
  const ComplainsList({super.key});

  @override
  State<ComplainsList> createState() => _ComplainsListState();
}

class _ComplainsListState extends State<ComplainsList> {
  void _handleApprove(int index) {
    setState(() {
      _requests[index].isResolved = true;
      _requests[index].isApproved = true;
    });
    _showActionSnackbar("Request approved");
  }

  void _handleReject(int index) {
    setState(() {
      _requests[index].isResolved = true;
      _requests[index].isApproved = false;
    });
    _showActionSnackbar("Request rejected");
  }

  void _showActionSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: _requests.length,
      itemBuilder: (context, index) {
        return RequestCard(
          request: _requests[index],
          onApprove: () => _handleApprove(index),
          onReject: () => _handleReject(index),
        );
      },
    );
  }

  final List<MaintenanceRequest> _requests = [
    MaintenanceRequest(
      flatNumber: "2",
      issueDate: "01/02/2024",
      comments: "Electrical Issue",
      isResolved: false,
    ),
    MaintenanceRequest(
      flatNumber: "5",
      issueDate: "03/02/2024",
      comments: "Plumbing Issue",
      isResolved: false,
    ),
    MaintenanceRequest(
      flatNumber: "12",
      issueDate: "10/02/2024",
      comments: "Broken Window",
      isResolved: false,
    ),
    MaintenanceRequest(
      flatNumber: "7",
      issueDate: "15/02/2024",
      comments: "Heater Not Working",
      isResolved: false,
    ),
    MaintenanceRequest(
      flatNumber: "3",
      issueDate: "21/02/2024",
      comments: "Water Leak",
      isResolved: false,
    ),
    MaintenanceRequest(
      flatNumber: "9",
      issueDate: "28/02/2024",
      comments: "Door Lock Issue",
      isResolved: false,
    ),
  ];
}

class MaintenanceRequest {
  final String flatNumber;
  final String issueDate;
  final String comments;
  bool isResolved;
  bool isApproved;

  MaintenanceRequest({
    required this.flatNumber,
    required this.issueDate,
    required this.comments,
    required this.isResolved,
    this.isApproved = false,
  });
}
