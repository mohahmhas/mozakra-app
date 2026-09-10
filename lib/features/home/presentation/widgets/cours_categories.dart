import 'package:flutter/material.dart';
import 'package:e_store/features/home/presentation/widgets/cours_categories_card.dart';

class CoursCategories extends StatelessWidget {
  const CoursCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CoursCategoriesCard(),
        CoursCategoriesCard(),
        CoursCategoriesCard(),
      ],
    );
  }
}
