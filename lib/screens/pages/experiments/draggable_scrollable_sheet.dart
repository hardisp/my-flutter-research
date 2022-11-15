import 'package:flutter/material.dart';

class ScreenDraggableScrollableSheet extends StatefulWidget {
  const ScreenDraggableScrollableSheet({Key? key}) : super(key: key);

  @override
  State<ScreenDraggableScrollableSheet> createState() =>
      _ScreenDraggableScrollableSheetState();
}

class _ScreenDraggableScrollableSheetState
    extends State<ScreenDraggableScrollableSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DraggableScrollableSheet'),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
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
      ),
    );
  }
}
