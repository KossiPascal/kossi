import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class ConvexBottomBarWidget extends StatelessWidget {
  const ConvexBottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello ConvexAppBar')),
      body: Center(
          child: TextButton(
              child: const Text('Click to show full example'),
              onPressed: () {})),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.list),
          // TabItem(icon: Icons.calendar_today),
          // TabItem(icon: Icons.assessment),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
