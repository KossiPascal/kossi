import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CurvedNavigationBarWidget extends StatefulWidget {
  const CurvedNavigationBarWidget({Key? key}) : super(key: key);

  @override
  _CurvedNavigationBarWidgetState createState() => _CurvedNavigationBarWidgetState();
}

class _CurvedNavigationBarWidgetState extends State<CurvedNavigationBarWidget> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: const <Widget>[
            Icon(Icons.add, size: 40),
            Icon(Icons.list, size: 40),
            // Icon(Icons.compare_arrows, size: 30),
            // Icon(Icons.call_split, size: 30),
            // Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          // animationCurve: Curves.easeInOut,
          // animationCurve: Curves.easeOut,
          animationCurve: Curves.easeInOutBack,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.blueAccent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(_page.toString(), textScaleFactor: 10.0),
                  ElevatedButton(
                    child: const Text('Go To Page of index 1'),
                    onPressed: () {
                      final CurvedNavigationBarState? navBarState =
                          _bottomNavigationKey.currentState;
                      navBarState?.setPage(1);
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
