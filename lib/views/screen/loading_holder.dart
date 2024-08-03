import 'package:flutter/material.dart';

class LoadingHolder extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const LoadingHolder({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            height: 100,
            width: 100,
            color: Colors.green,
            child: const CircularProgressIndicator(),
          )
      ],
    );
  }
}
