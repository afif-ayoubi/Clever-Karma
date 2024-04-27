import 'package:flutter/material.dart';

class OnBoardingBtn extends StatelessWidget {
  final void Function() onPressed;
  const OnBoardingBtn({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_forward_outlined),
      label: const Text(''),
    );
  }
}
