import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,

    this.leading,

    this.title,

    this.actions,

    this.centerTitle = true,

    this.automaticallyImplyLeading = false,

    this.bottom,
  });

  final Widget? leading;

  final Widget? title;

  final List<Widget>? actions;

  final PreferredSizeWidget? bottom;

  final bool centerTitle;

  final bool automaticallyImplyLeading;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,

      leading: leading,

      title: title,

      actions: actions,

      centerTitle: centerTitle,

      bottom: bottom,
    );
  }
}

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final List<Widget>? actions;
//   final bool titleApp;

//   final bool centerTitle;

//   final Widget? leading;

//   final bool showBackButton;

//   final VoidCallback? onBackPressed;
//   const CustomAppBar({
//     super.key,

//     this.title,
//     this.titleApp = false,
//     this.centerTitle = true,

//     this.leading,

//     this.actions,

//     this.showBackButton = false,

//     this.onBackPressed,
//   });

//   @override
//   Size get preferredSize => Size.fromHeight(65.h);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       automaticallyImplyLeading: false,

//       elevation: 0,

//       scrolledUnderElevation: 0,

//       backgroundColor: Theme.of(context).appBarTheme.backgroundColor,

//       centerTitle: centerTitle,

//       toolbarHeight: 65.h,

//       leading: showBackButton
//           ? IconButton(
//               onPressed: onBackPressed ?? () => Navigator.pop(context),

//               icon: Icon(
//                 Icons.arrow_back_ios_new_rounded,
//                 color: Theme.of(context).colorScheme.onSurface,
//               ),
//             )
//           : leading,

//       title: titleApp
//           ? TitleApp()
//           : title != null
//           ? Text(title!, style: AppTextStyles.titleMedium)
//           : null,

//       actions: actions,
//     );
//   }
// }
