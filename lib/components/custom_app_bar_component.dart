import 'package:flutter/material.dart';

class CustomAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget {
  CustomAppBarComponent({
    super.key,
    required this.title,
    this.centerTitle,
    this.backgourdColor,
  });

  bool? centerTitle;
  String title;
  Color? backgourdColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle ?? true,
      backgroundColor: backgourdColor,
    );
  }

  @override
  Size get preferredSize => const Size(0, 60);
}
