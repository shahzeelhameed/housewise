import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class AdminNotice extends StatelessWidget {
  const AdminNotice({
    super.key,
    required this.title,
    required this.description,
    this.onEdit,
    this.onDelete,
  });

  final String title;
  final String description;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 100,
      width: ScreenSize(context).screenWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.black, width: 1.5)),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.largeBold,
                ),
                Expanded(
                  child: Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child:
                        IconButton(onPressed: onEdit, icon: Icon(Icons.edit))),
                Expanded(
                    child: IconButton(
                        onPressed: onDelete, icon: Icon(Icons.delete))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
