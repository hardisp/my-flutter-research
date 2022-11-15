import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:only_for_dev/widgets/tinder_swipe/widget_tinder_swipe_main.dart';

class ScreenTinderSwipeDraggableScrollableSheet extends StatefulWidget {
  const ScreenTinderSwipeDraggableScrollableSheet({Key? key}) : super(key: key);

  @override
  State<ScreenTinderSwipeDraggableScrollableSheet> createState() =>
      _ScreenTinderSwipeDraggableScrollableSheetState();
}

class _ScreenTinderSwipeDraggableScrollableSheetState
    extends State<ScreenTinderSwipeDraggableScrollableSheet> {
  bool isDragged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tinder Swipe Scrollable'),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.05,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 28),
                // color: Colors.red,
                child: const Center(
                  child: Text(
                    'You have 12 new incoming order!',
                  ),
                ),
                // color: Colors.red,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.58,
                width: double.infinity,
                // color: Colors.greenAccent,
                child: const WidgetTinderSwipeCardStack(),
              ),
              const Center(
                child: Text('Swipe right to confirm'),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.175,
            maxChildSize: 1,
            minChildSize: 0.175,
            builder: (BuildContext context, ScrollController scrollController) {
              if (scrollController.hasClients) {
                scrollController.removeListener(() {
                  inspect(scrollController.position);
                });
                scrollController.addListener(() {
                  double currentScroll = scrollController.position.pixels;
                  if (scrollController.position.outOfRange) {
                    inspect('object');
                  }
                  if (currentScroll > 0) {
                    if (!isDragged) {
                      Future.delayed(Duration.zero, () {
                        setState(() {
                          isDragged = true;
                        });
                      });
                    }
                  } else {
                    if (isDragged) {
                      Future.delayed(Duration.zero, () {
                        setState(() {
                          isDragged = false;
                        });
                      });
                    }
                  }
                });
              }

              return Container(
                color: Colors.blue[100],
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 25,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text('Item $index'));
                  },
                ),
              );
            },
          ),
          // const Positioned(bottom: 10, child: Text('New Order 12')),
          // if (isDragged)
          AnimatedPositioned(
            child: const Text('New Order 12'),
            duration: const Duration(milliseconds: 700),
            curve: Curves.fastOutSlowIn,
            bottom: isDragged ? 20 : -20,
          )
        ],
      ),
    );
  }
}
