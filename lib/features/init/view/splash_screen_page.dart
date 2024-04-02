import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/ui/utils/paths/colors_ui.dart';
import '../../main_explore/view/main_explore_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  @override
  State<SplashScreenPage> createState() => _SplashScreenPage();
}

class _SplashScreenPage extends State<SplashScreenPage> {
  final _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: const MainExplorePage(),
              duration: const Duration(milliseconds: 500)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => exit(0)));
        return;
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          key: _globalKey,
          body: Center(
            child: SpinKitFadingCircle(color: colors.primary500),
          )),
    );
  }
}
