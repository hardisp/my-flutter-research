part of widget_tinder_swipe_main;

enum Swipe { left, right, none }

class WidgetTinderSwipeCardDraggable extends StatefulWidget {
  const WidgetTinderSwipeCardDraggable({
    Key? key,
    required this.profile,
    required this.index,
    required this.swipeNotifier,
  }) : super(key: key);
  final ModelProfile profile;
  final int index;
  final ValueNotifier<Swipe> swipeNotifier;

  @override
  State<WidgetTinderSwipeCardDraggable> createState() =>
      _WidgetTinderSwipeCardDraggableState();
}

class _WidgetTinderSwipeCardDraggableState
    extends State<WidgetTinderSwipeCardDraggable> {
  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable<int>(
        // Data is the value this Draggable stores.
        axis: Axis.horizontal,
        data: widget.index,
        feedback: Material(
          color: Colors.transparent,
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, swipe, _) {
              return RotationTransition(
                turns: swipe != Swipe.none
                    ? swipe == Swipe.left
                        ? const AlwaysStoppedAnimation(-15 / 360)
                        : const AlwaysStoppedAnimation(15 / 360)
                    : const AlwaysStoppedAnimation(0),
                child: Stack(
                  children: [
                    WidgetTinderSwipeProfileCard(profile: widget.profile),
                    swipe != Swipe.none
                        ? swipe == Swipe.right
                            ? Positioned(
                                top: 40,
                                left: 20,
                                child: Transform.rotate(
                                  angle: 12,
                                  child: WidgetTinderSwipePartTag(
                                    text: 'LIKE',
                                    color: Colors.green[400]!,
                                  ),
                                ),
                              )
                            : Positioned(
                                top: 50,
                                right: 24,
                                child: Transform.rotate(
                                  angle: -12,
                                  child: WidgetTinderSwipePartTag(
                                    text: 'DISLIKE',
                                    color: Colors.red[400]!,
                                  ),
                                ),
                              )
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            },
          ),
        ),
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          // When Draggable widget is dragged right
          if (dragUpdateDetails.delta.dx > 0 &&
              dragUpdateDetails.globalPosition.dx >
                  MediaQuery.of(context).size.width / 2) {
            swipeNotifier.value = Swipe.right;
          }
          // When Draggable widget is dragged left
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width / 2) {
            swipeNotifier.value = Swipe.left;
          }
        },
        onDragEnd: (drag) {
          swipeNotifier.value = Swipe.none;
        },

        childWhenDragging: Container(
          color: Colors.transparent,
        ),

        child: WidgetTinderSwipeProfileCard(
          profile: widget.profile,
        ),
      ),
    );
  }
}
