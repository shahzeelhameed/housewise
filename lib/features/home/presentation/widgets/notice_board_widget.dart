import 'package:flutter/material.dart';
import 'package:housewise/config/color/color.dart';
import 'package:housewise/config/screen_sizes/screen_sizes.dart';
import 'package:housewise/config/textstyles/text_styles.dart';

class NoticeBoard extends StatelessWidget {
  const NoticeBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 100,
      width: ScreenSize(context).screenWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.black, width: 1.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ABC",
            style: AppTextStyles.largeBold,
          ),
          Expanded(
            child: Text(
              "wecmpoecppekcpowekcopwekcpoewkcwepkcewpkcewpkckewcewoijvioerqnviuernvbuiernvuiernivnreuivneriunvreiuvnerivnerivneriuvnerunuiwunecnreiunvnerivnerivnernivernnvrin",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
