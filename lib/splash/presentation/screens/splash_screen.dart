import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/presentation/styles/app_images.dart';
import '../../../core/presentation/styles/sizes.dart';
import '../../../core/presentation/widgets/empty_appbar_widget.dart';
import '../../../onboarding/onbording.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Onbording(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: EmptyAppBar(
        statusBarColor: Theme.of(context).primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          systemNavigationBarColor: Theme.of(context).primaryColor,
        ),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).primaryColor,
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          padding: const EdgeInsets.symmetric(horizontal: Sizes.marginH30),
          child:
              // SvgPicture.asset(
              //   'assets/images/1.svg',
              //   fit: BoxFit.fill,
              // )
              const Image(
            image: AssetImage(
              AppImages.splashLogo,
            ),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
