import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_sharing_app/src/common_widgets/faded_animation/faded_animation_controller.dart';
import 'package:notes_sharing_app/src/common_widgets/faded_animation/faded_animation_modal.dart';

class TFadedAnimation extends StatelessWidget {
  TFadedAnimation(
      {super.key,
      this.animationPosition,
      required this.child,
      required this.durationInMs});

  final controller = Get.put(FadedAnimationController());
  final int durationInMs;
  final TAnimationPosition? animationPosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: durationInMs),
        top: controller.animate.value
            ? animationPosition!.topAfter
            : animationPosition!.topBefore,
        bottom: controller.animate.value
            ? animationPosition!.bottomAfter
            : animationPosition!.bottomBefore,
        left: controller.animate.value
            ? animationPosition!.leftAfter
            : animationPosition!.leftAfter,
        right: controller.animate.value
            ? animationPosition!.rightAfter
            : animationPosition!.rightAfter,
        child: AnimatedOpacity(
          opacity: controller.animate.value ? 1 : 0,
          duration: Duration(microseconds: durationInMs),
          child: AnimatedOpacity(
            opacity: controller.animate.value?1:0,
            duration: Duration(microseconds: durationInMs),
            child: child,
          ),
        ),
      ),
    );
  }
}
