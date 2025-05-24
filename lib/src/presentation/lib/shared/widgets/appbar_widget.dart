import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackBtn;
  final bool centerTitle;
  final List<Widget>? actions;

  const AppbarWidget({
    super.key,
    required this.title,
    required this.centerTitle,
    this.showBackBtn = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackBtn ? const BackButton() : null,
      title: Text(title),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
