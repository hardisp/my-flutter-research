part of widget_tinder_swipe_main;

class WidgetTinderSwipeCard extends StatelessWidget {
  const WidgetTinderSwipeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(64),
            bottomRight: Radius.circular(64),
          ),
        ),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFFFD0E42),
            Color.fromARGB(255, 185, 9, 41),
          ],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 46.0, left: 20.0),
        child: Text(
          'Discover',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 36,
          ),
        ),
      ),
    );
  }
}
