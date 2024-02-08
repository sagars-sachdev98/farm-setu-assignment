import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget? child;
  final Widget? title;
  final Color? appBarBackgroundColor;
  const BaseView(
      {super.key, this.child, this.title, this.appBarBackgroundColor});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != null
          ? AppBar(
              title: title,
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              backgroundColor: appBarBackgroundColor,
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: child ?? Container(),
        ),
      ),
    );
  }
}
