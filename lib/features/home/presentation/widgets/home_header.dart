import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String? userName;
  const HomeHeader({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              userName == null
                  ? Text(
                      '${LocaleKeys.hi.tr()} 👋',
                      style: context.textTheme.headlineLarge,
                    )
                  : Text(
                      '${LocaleKeys.hi.tr()} ${userName!} 👋',
                      style: context.textTheme.headlineLarge,
                    ),
              Text(
                LocaleKeys.keepUpTheGoodWork.tr(),
                style: context.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
