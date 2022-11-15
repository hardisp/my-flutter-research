import 'package:flutter/material.dart';
import 'package:only_for_dev/screens/pages/generals/screen_page_general_about.dart';
import 'package:only_for_dev/screens/pages/generals/screen_page_general_anchor.dart';
import 'package:only_for_dev/screens/pages/generals/screen_page_general_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Main Flutter For Dev',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyStatefulWidget(),
      // home: const ScreenPageMain(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ScreenPageGeneralMain(),
    ScreenPageGeneralAnchor(),
    ScreenPageGeneralAbout(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App Sample'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.anchor),
              label: 'Anchor',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'About',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[500],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
