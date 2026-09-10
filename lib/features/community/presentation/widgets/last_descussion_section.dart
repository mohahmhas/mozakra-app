import 'package:e_store/core/facke_data.dart';
import 'package:e_store/features/community/presentation/widgets/last_descussion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastDescussionSection extends StatelessWidget {
  const LastDescussionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: ListView.builder(
        itemCount: posts.length,
        padding: EdgeInsets.only(bottom: 70.h),
        itemBuilder: (context, index) {
          return LastDescussionCard(postEntity: posts[index]);
        },
      ),
    );
  }
}
