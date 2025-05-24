import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';

class BaseTemplate extends StatelessWidget {
  final String titleAppar;
  final bool? showLeadingBtnAppar;
  final bool? centerTitleAppar;
  final Widget body;
  final List<Widget>? actions;

  const BaseTemplate({
    super.key,
    required this.titleAppar,
    this.showLeadingBtnAppar,
    this.centerTitleAppar,
    required this.body,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: titleAppar,
        showBackBtn: showLeadingBtnAppar ?? true,
        centerTitle: centerTitleAppar ?? true,
        actions: actions,
      ),
      body: SafeArea(child: body),
    );
  }
}
