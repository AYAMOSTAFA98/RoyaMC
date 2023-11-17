import 'package:flutter/material.dart';
import '../core/presentation/styles/font_styles.dart';
import '../core/presentation/styles/sizes.dart';
import '../core/presentation/widgets/empty_appbar_widget.dart';
import '../main_page.dart';
import 'content_model.dart';

class Onbording extends StatefulWidget {
  const Onbording({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(
                  statusBarColor:  Color(0xFFFFFFFF),
                ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
          controller: _controller,
          itemCount: contents.length,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (_, i) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  contents[i].image,
                  fit: BoxFit.fill, alignment: Alignment.center,
                  //height: 400,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      contents[i].discription,
                      textAlign: TextAlign.start,
                      style: FontStyles.onboardingFontStyle(context)
                    ),
                    const SizedBox(height: Sizes.marginH30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            contents.length,
                            (index) => buildDot(index, context),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (currentIndex == contents.length - 1) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const MainPage(),
                                ),
                              );
                            }
                            _controller!.nextPage(
                              duration: const Duration(milliseconds: 100),
                              curve: Curves.bounceIn,
                            );
                          },
                          child: CircleAvatar(
                              radius: Sizes.buttonR25,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: const Icon(Icons.arrow_forward,size: Sizes.icon30,)
                              // Text(currentIndex == contents.length - 1
                              //     ? "Continue"
                              //     : "Next"),
                              ),
                        ),
                        
                      ],
                    ),
                    const SizedBox(height: Sizes.marginV62),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 4,
      width: 13,
      //width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? Theme.of(context).primaryColor
            : Theme.of(context).primaryColor.withOpacity(0.3),
      ),
    );
  }
}
