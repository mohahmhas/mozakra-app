import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CourseTitle extends StatelessWidget {
  final String title;
  const CourseTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.title28Blod.copyWith(color: context.textPrimary),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
