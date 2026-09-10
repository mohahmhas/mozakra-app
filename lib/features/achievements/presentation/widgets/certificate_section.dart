import 'package:e_store/features/achievements/domain/entities/certificate_entity.dart';
import 'package:e_store/features/achievements/presentation/widgets/certificate_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CertificateSection extends StatelessWidget {
  final List<CertificateEntity> certificates;

  const CertificateSection({super.key, required this.certificates});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: 360.h,
          width: 350.w,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const ScrollPhysics(),
            itemCount: certificates.length,

            itemBuilder: (context, index) {
              return CertificateCard(certificate: certificates[index]);
            },
          ),
        );
      },
    );
  }
}
