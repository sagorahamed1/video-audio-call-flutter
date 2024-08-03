import 'package:flutter/cupertino.dart';

class TapBar extends StatelessWidget {
  final String title;
  final String upperTitle;
  const TapBar({super.key, required this.title, required this.upperTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(),
      ),
    );
  }
}
