part of widget_tinder_swipe_main;

class WidgetTinderSwipeProfileCard extends StatelessWidget {
  const WidgetTinderSwipeProfileCard({Key? key, required this.profile})
      : super(key: key);
  final ModelProfile profile;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: profile.bgColor ?? Colors.grey,
                    // child: Image.asset(
                    //   profile.imageAsset,
                    //   fit: BoxFit.fitHeight,
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.name,
                              style: const TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                                fontSize: 21,
                              ),
                            ),
                            Text(
                              profile.distance,
                              style: const TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            //   Positioned(
            //     bottom: 0,
            //     child: Container(
            //       height: 80,
            //       width: 340,
            //       decoration: ShapeDecoration(
            //         color: Colors.white,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         shadows: <BoxShadow>[
            //           BoxShadow(
            //             color: Colors.black.withOpacity(0.05),
            //             blurRadius: 8,
            //           ),
            //         ],
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.only(left: 20),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               profile.name,
            //               style: const TextStyle(
            //                 fontFamily: 'Nunito',
            //                 fontWeight: FontWeight.w800,
            //                 fontSize: 21,
            //               ),
            //             ),
            //             Text(
            //               profile.distance,
            //               style: const TextStyle(
            //                 fontFamily: 'Nunito',
            //                 fontWeight: FontWeight.w400,
            //                 fontSize: 14,
            //                 color: Colors.grey,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
