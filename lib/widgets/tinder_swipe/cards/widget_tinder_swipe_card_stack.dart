part of widget_tinder_swipe_main;

// class WidgetTinderSwipeProfileCard extends StatelessWidget {
class WidgetTinderSwipeCardStack extends StatefulWidget {
  const WidgetTinderSwipeCardStack({Key? key}) : super(key: key);

  @override
  State<WidgetTinderSwipeCardStack> createState() => _CardsStackWidgetState();
}

class _CardsStackWidgetState extends State<WidgetTinderSwipeCardStack> {
  List<ModelProfile> draggableItems = [
    const ModelProfile(
      name: 'Card',
      distance: '10 miles away',
      imageAsset: 'assets/images/avatar_1.png',
      bgColor: Colors.red,
    ),
    const ModelProfile(
      name: 'Card',
      distance: '10 miles away',
      imageAsset: 'assets/images/avatar_2.png',
      bgColor: Colors.black,
    ),
    const ModelProfile(
      name: 'Card',
      distance: '10 miles away',
      imageAsset: 'assets/images/avatar_3.png',
      bgColor: Colors.green,
    ),
    const ModelProfile(
      name: 'Card',
      distance: '10 miles away',
      imageAsset: 'assets/images/avatar_4.png',
      bgColor: Colors.amberAccent,
    ),
    const ModelProfile(
      name: 'Card',
      distance: '10 miles away',
      imageAsset: 'assets/images/avatar_5.png',
      bgColor: Colors.orange,
    ),
  ];

  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        const Center(
          child: Text('No Card'),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, swipe, _) => Padding(
              padding: EdgeInsets.only(top: draggableItems.length * 5.0),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: List.generate(draggableItems.length, (index) {
                  return Positioned(
                    top: index * -5,
                    child: WidgetTinderSwipeCardDraggable(
                      profile: draggableItems[index],
                      index: index,
                      swipeNotifier: swipeNotifier,
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                draggableItems.removeAt(index);
              });
            },
          ),
        ),
        Positioned(
          right: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                draggableItems.removeAt(index);
              });
            },
          ),
        ),
      ],
    );
  }
}
