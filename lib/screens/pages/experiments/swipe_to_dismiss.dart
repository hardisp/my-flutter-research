import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSwipeToDismiss extends StatefulWidget {
  const ScreenSwipeToDismiss({Key? key}) : super(key: key);

  @override
  State<ScreenSwipeToDismiss> createState() => _ScreenSwipeToDismissState();
}

class _ScreenSwipeToDismissState extends State<ScreenSwipeToDismiss>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  bool isPlaying = false;
  double pos = -math.pi / 10;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(20, (i) => 'Item ${i + 1}');
    const title = 'Dismissing Items';
    int i = 0;
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
          leading: CupertinoButton(
            onPressed: Navigator.of(context).pop,
            child: const Icon(
              CupertinoIcons.back,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              direction: DismissDirection.endToStart,
              dismissThresholds: const {DismissDirection.endToStart: 0},
              key: UniqueKey(),
              onResize: () {
                inspect(i++);
              },
              onDismissed: (direction) async {
                setState(() {
                  pos = -math.pi / 180;
                });
                await Future.delayed(const Duration(milliseconds: 1000), () {
                  setState(() {
                    items.removeAt(index);
                    pos = -math.pi / 10;
                  });
                });

                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              // Show a red background as the item is swiped away.
              background: Container(
                  color: Colors.green[400],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.rotate(
                        angle: pos,
                        child: const IconButton(
                          icon: Icon(
                            Icons.thumb_up,
                            color: Colors.white,
                          ),
                          onPressed: null,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'Ready',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
              child: ListTile(
                title: Text(item),
              ),
            );
          },
        ),
      ),
    );
  }
}
