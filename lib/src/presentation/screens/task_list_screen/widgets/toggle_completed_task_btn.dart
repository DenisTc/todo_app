import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/src/core/constants/app_icons.dart';

class ToggleCompletedTaskBtn extends StatelessWidget {
  const ToggleCompletedTaskBtn({
    Key? key,
    required this.isShowColpletedTask,
  }) : super(key: key);

  final bool isShowColpletedTask;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: ScaleTransition(scale: animation, child: child),
      ),
      child: SvgPicture.asset(
        !isShowColpletedTask ? AppIcons.visibilityOn : AppIcons.visibilityOff,
        width: 24,
        height: 16,
        key: ValueKey(!isShowColpletedTask),
      ),
    );
  }
}
