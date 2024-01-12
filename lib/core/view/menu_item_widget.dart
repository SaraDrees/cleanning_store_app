
import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MenuItemWidget extends StatefulWidget {
  const MenuItemWidget(
      {Key? key,
      required this.title,
      required this.iconData,
      this.index,
      this.onClick, })
      : super(key: key);

  final IconData iconData;
  final String title;
  final int? index;
  final VoidCallback? onClick;

  @override
  State<MenuItemWidget> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if ((widget.index ?? -1) >= 0) {
         Navigator.pop(context);
        }
        if (widget.onClick != null) {
          widget.onClick!();
        }
      },
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          foregroundColor: AppColors.enabledBorder ,
          ),
      child: Row(
        children: [
          SizedBox(
            width: 6.w,
          ),
          Icon(widget.iconData,
              color: AppColors.textColorPrimary
                      .withOpacity(0.5)),
          SizedBox(
            width: 4.w,
          ),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.textColorPrimary
                        .withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}
