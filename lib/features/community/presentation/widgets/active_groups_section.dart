import 'package:e_store/features/community/domain/entities/active_group_entity.dart';
import 'package:e_store/features/community/presentation/widgets/active_groups_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveGroupsSection extends StatelessWidget {
  final List<ActiveGroupEntity> activeGroupList;
  const ActiveGroupsSection({super.key, required this.activeGroupList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      width: 390.w,
      child: ListView.builder(
        itemCount: activeGroupList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ActiveGroupsCard(activeGroupEntity: activeGroupList[index]);
        },
      ),
    );
  }
}
