import 'package:e_store/core/shared/helpers/spacing.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/features/details_course/domain/entities/review_entity.dart';
import 'package:flutter/material.dart';

class StudentReviewsList extends StatelessWidget {
  final List<ReviewEntity> reviews;
  const StudentReviewsList({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(child: Text(review.userName[0])),
                horizontalSpace(12),
                Column(
                  children: [
                    Text(
                      review.userName,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(review.time, style: AppTextStyles.bodyMedium),
                  ],
                ),
                horizontalSpace(12),
                Row(
                  children: List.generate(
                    5,
                    (starIndex) => Icon(
                      Icons.star,
                      color: starIndex < review.rating
                          ? Colors.amber
                          : Colors.grey[300],
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),

            Text(review.comment),
            verticalSpace(25),
          ],
        );
      },
    );
  }
}
