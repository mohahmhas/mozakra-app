import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CourseDescription extends StatelessWidget {
  final String description;
  const CourseDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: AppTextStyles.bodyLarge.copyWith(color: context.primary),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
