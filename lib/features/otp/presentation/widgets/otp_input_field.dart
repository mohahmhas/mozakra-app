import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPinField extends StatelessWidget {
  final PinInputController controller;

  final ValueChanged<String> onChanged;

  final ValueChanged<String>? onCompleted;

  const OtpPinField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: MaterialPinField(
        pinController: controller,

        length: 6,

        keyboardType: TextInputType.number,

        onChanged: onChanged,

        onCompleted: onCompleted,

        theme: MaterialPinTheme(
          shape: MaterialPinShape.outlined,

          cellSize: const Size(36, 50),

          borderRadius: BorderRadius.circular(16),

          focusedBorderColor: AppColors.primary.withAlpha(20),

          fillColor: AppColors.primary.withAlpha(20),

          borderColor: AppColors.border,
        ),
      ),
    );
  }
}
