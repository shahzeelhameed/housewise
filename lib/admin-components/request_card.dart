import 'package:flutter/material.dart';
import 'package:housewise/admin-features/manage-complaints/presentation/widgets/req_grid_widget.dart';

class RequestCard extends StatelessWidget {
  final MaintenanceRequest request;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const RequestCard({
    super.key,
    required this.request,
    required this.onApprove,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Request from',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Flat No: ${request.flatNumber}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Issue Raised: ${request.issueDate}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              'Comments: ${request.comments}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            request.isResolved
                ? Center(
                    child: Text(
                      request.isApproved ? 'Approved' : 'Rejected',
                      style: TextStyle(
                        color: request.isApproved
                            ? Colors.green[300]
                            : Colors.red[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: onApprove,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 20,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: onReject,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 20,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
