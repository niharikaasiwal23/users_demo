import 'package:flutter/material.dart';
import 'package:users_list_demo/core/theme/app_colors.dart';

class CornerCrossButton extends StatelessWidget {
  const CornerCrossButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Color(0xFFD3D7DD),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.clear_rounded,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
