import 'package:cleanning_store_app/core/app_colors.dart';
import 'package:cleanning_store_app/core/view/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class MainScaffold extends StatefulWidget {
  final Widget body;
  final String title;
  final Widget? drawer;

  const MainScaffold({
    Key? key,
    required this.body,
    required this.title,
    this.drawer,
  }) : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.drawer ?? const AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 7.w,
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: AppColors.colorPrimary, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 0.0, right: 0.0, top: 0.0, bottom: 0.0),
          child: widget.body,
        ),
      ),
    );
  }
}
