import 'package:flutter/material.dart';
import 'package:only_for_dev/screens/pages/experiments/draggable_scrollable_sheet.dart';
import 'package:only_for_dev/screens/pages/experiments/swipe_to_dismiss.dart';
import 'package:only_for_dev/screens/pages/experiments/tinder_swipe.dart';
import 'package:only_for_dev/screens/pages/experiments/tinder_swipe_draggable_scrollable_sheet.dart';

class ScreenAnchor {
  const ScreenAnchor({
    required this.label,
    required this.screen,
  });

  final String label;
  final Widget screen;
}

class ScreenPageGeneralAnchor extends StatelessWidget {
  const ScreenPageGeneralAnchor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ScreenAnchor> items = [
      const ScreenAnchor(
        label: 'Swipe to Dismiss',
        screen: ScreenSwipeToDismiss(),
      ),
      const ScreenAnchor(
        label: 'Swipe Tinder',
        screen: ScreenExperimentTinderSwipe(),
      ),
      const ScreenAnchor(
        label: 'Draggable Scrollable Sheet',
        screen: ScreenDraggableScrollableSheet(),
      ),
      const ScreenAnchor(
        label: 'Tinder Draggable Scrollable Sheet',
        screen: ScreenTinderSwipeDraggableScrollableSheet(),
      ),
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => item.screen,
              maintainState: false,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 3.0,
                  offset: const Offset(0.0, 3.0),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 16,
            ),
            child: Text(
              item.label,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
