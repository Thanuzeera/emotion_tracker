import 'package:emotiontrackerapp/constants/colors.dart';
import 'package:emotiontrackerapp/data/mood_data.dart';
import 'package:emotiontrackerapp/presentation/screens/mood_screen.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import '../widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late LiquidController _liquidController;


  @override
  void initState() {
    _liquidController = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe.builder(
            itemCount: moodData.length,
            itemBuilder: (context, index) {
              final data = moodData[index % moodData.length];
              return Container(
                width: double.infinity,
                color: _getPageColor(index),
                child: Stack(
                  children: [
                    Positioned(
                      top: index == 1
                          ? MediaQuery.of(context).size.height * 0.3
                          : MediaQuery.of(context).size.height * 0.4,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Lottie.asset(
                          data.asset,
                          width: index == 1 ? 300 : 250,
                          height: index == 1 ? 300 : 250,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.33,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          data.moodText,
                          style: TextStyle(
                            color: data.moodColor,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            liquidController: _liquidController,
            onPageChangeCallback: pageChangeCallback,
            waveType: WaveType.liquidReveal,
            fullTransitionValue: 880,
            enableSideReveal: true,
            preferDragFromRevealedArea: true,
            enableLoop: true,
            ignoreUserGestureWhileAnimating: true,
            positionSlideIcon: 0.8,
            slideIconWidget: Icon(Icons.arrow_back_ios),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 140.0),
              child: Text(
                'How are you\nfeeling today?',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: CustomButton(
                buttonText: moodData[0].buttonText,
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1500),
                      pageBuilder: (context, animation, secondaryAnimation) => MoodScreen(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getPageColor(int index) {
    switch (index) {
      case 0:
        return AppColors.pink;
      case 1:
        return AppColors.yellow;
      case 2:
        return AppColors.blue;
      case 3:
        return AppColors.indigo;
      case 4:
        return AppColors.orange;
      default:
        return AppColors.pink;
    }
  }

  pageChangeCallback(int lpage) {
    setState(() {
      var page = lpage;
    });
  }
}


// import 'package:emotiontrackerapp/data/mood_data.dart';
// import 'package:flutter/material.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:lottie/lottie.dart';

// import 'mood_screen.dart';

// class OnboardingScreen extends StatefulWidget {
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   late LiquidController _liquidController;

//   @override
//   void initState() {
//     _liquidController = LiquidController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           LiquidSwipe.builder(
//             itemCount: moodData.length,
//             itemBuilder: (context, index) {
//               final data = moodData[index % moodData.length];
//               return Container(
//                 color: _getPageColor(index),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Lottie.asset(
//                       data.asset,
//                       width: 250,
//                       height: 250,
//                       fit: BoxFit.cover,
//                     ),
//                     SizedBox(height: 40),
//                     Text(
//                       data.moodText,
//                       style: TextStyle(
//                         color: data.moodColor,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//             liquidController: _liquidController,
//             onPageChangeCallback: pageChangeCallback,
//             waveType: WaveType.liquidReveal,
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.all(40.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => MoodScreen()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
//                   backgroundColor: Colors.black,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: Text(
//                   "Get Started",
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void pageChangeCallback(int page) {
//     setState(() {});
//   }

//   Color _getPageColor(int index) {
//     switch (index) {
//       case 0:
//         return Colors.pinkAccent;
//       case 1:
//         return Colors.yellow;
//       case 2:
//         return Colors.lightBlue;
//       case 3:
//         return Colors.indigoAccent;
//       case 4:
//         return Colors.orange;
//       default:
//         return Colors.pinkAccent;
//     }
//   }
// }

