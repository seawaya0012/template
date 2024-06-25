import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.center,
      child: LoadingAnimationWidget.hexagonDots(
          color: Theme.of(context).backgroundColor,
          size: 35),
    );
  }
}
