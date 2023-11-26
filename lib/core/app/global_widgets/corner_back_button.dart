import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class CornerBackButton extends StatelessWidget {
  const CornerBackButton({
    super.key, this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {
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
            Icons.arrow_back,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
