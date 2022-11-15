import 'package:flutter/material.dart';
import 'package:only_for_dev/widgets/tinder_swipe/widget_tinder_swipe_main.dart';

class ScreenExperimentTinderSwipe extends StatelessWidget {
  const ScreenExperimentTinderSwipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Swipe Tinder Example'),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: const [
            WidgetTinderSwipeCard(),
            WidgetTinderSwipeCardStack()
            // CardsStackWidget(),
          ],
        ),
      ),
    );
  }
}
