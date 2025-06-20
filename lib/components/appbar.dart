import 'package:flutter/material.dart';
import 'package:technews_flutter/utils/colors.dart';
import 'package:technews_flutter/utils/text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget{
   appbar({Key ? key})
     :preferredSize = Size.fromHeight(50.0),
             super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      title: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(text: 'Tech',size: 20, color: AppColors.primary),
            ModifiedText(text: 'News',size: 20, color: AppColors.lightWhite),
          ],
        ),
      ),
      centerTitle: true,
      actions: [
      ],
    );
  }
}
