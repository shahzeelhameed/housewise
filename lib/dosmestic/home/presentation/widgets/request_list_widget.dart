import 'package:flutter/material.dart';
import 'package:housewise/admin-features/manage-complaints/presentation/widgets/req_grid_widget.dart';
import 'package:housewise/dosmestic/components/domestic_request_card.dart';
import 'package:housewise/dosmestic/home/presentation/widgets/comment_dialog_widget.dart';
import 'package:housewise/utils/utils.dart';
// Ensure this path is correct

class DomesticComplainsList extends StatefulWidget {
  const DomesticComplainsList({super.key});

  @override
  State<DomesticComplainsList> createState() => _DomesticComplainsListState();
}

class _DomesticComplainsListState extends State<DomesticComplainsList> {
  final List<MaintenanceRequest> domesticRequests = [
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

  // void _handleApprove(int index) {
  //   setState(() {
  //     domesticRequests[index].isResolved = true;
  //     domesticRequests[index].isApproved = true;
  //   });
  //   _showActionSnackbar("Request approved");
  // }

  // void _handleReject(int index) {
  //   setState(() {
  //     domesticRequests[index].isResolved = true;
  //     domesticRequests[index].isApproved = false;
  //   });
  //   _showActionSnackbar("Request rejected");
  // }

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
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: domesticRequests.length,
      itemBuilder: (context, index) {
        return DomesticRequestCard(
            request: domesticRequests[index],
            onApprove: () => {
                  Utils.showCommentDialog(
                      context: context,
                      widget: CommentDialogWidget(
                        title: "Approved",
                      ))
                },
            onReject: () => {
                  Utils.showCommentDialog(
                    context: context,
                    widget: CommentDialogWidget(
                      title: "Rejected",
                    ),
                  )
                });
      },
    );
  }
}
