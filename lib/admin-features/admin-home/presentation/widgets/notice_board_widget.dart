import 'package:flutter/material.dart';
import 'package:housewise/admin-components/blue_section_titile.dart';
import 'package:housewise/admin-features/admin-home/presentation/widgets/admin_notice_board_widget.dart';
import 'package:housewise/admin-features/admin-home/presentation/widgets/title_input_widget.dart';
import 'package:housewise/admin-features/admin-home/presentation/widgets/writeHere_input_widget.dart';
import 'package:housewise/features/request-maintaince/presentation/widgets/description_input_widget.dart';

class AdminNoticeBoardWidget extends StatelessWidget {
  const AdminNoticeBoardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlueSectionTitile(title: "Edit Notice Board"),
          NoticeManagementScreen()
        ],
      ),
    );
  }
}
