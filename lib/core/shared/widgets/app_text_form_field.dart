import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/theme/tokens/app_radius.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/theme/typography/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,

    this.controller,

    this.hintText,

    this.labelText,

    this.keyboardType,

    this.textInputAction,

    this.validator,

    this.onChanged,

    this.prefixIcon,

    this.suffixIcon,

    this.obscureText = false,

    this.enabled = true,

    this.readOnly = false,

    this.maxLines = 1,

    this.minLines,

    this.onTap,

    this.inputFormatters,

    this.contentPadding,

    this.fillColor,

    this.borderColor,

    this.focusNode,
  });

  final TextEditingController? controller;

  final String? hintText;
  final String? labelText;

  final TextInputType? keyboardType;

  final TextInputAction? textInputAction;

  final String? Function(String?)? validator;

  final Function(String)? onChanged;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool obscureText;

  final bool enabled;

  final bool readOnly;

  final int maxLines;

  final int? minLines;

  final VoidCallback? onTap;

  final List<TextInputFormatter>? inputFormatters;

  final EdgeInsetsGeometry? contentPadding;

  final Color? fillColor;

  final Color? borderColor;

  final FocusNode? focusNode;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();

    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,

      focusNode: widget.focusNode,

      keyboardType: widget.keyboardType,

      textInputAction: widget.textInputAction,

      validator: widget.validator,

      onChanged: widget.onChanged,

      enabled: widget.enabled,

      readOnly: widget.readOnly,

      maxLines: widget.obscureText ? 1 : widget.maxLines,

      minLines: widget.minLines,

      obscureText: _obscureText,

      onTap: widget.onTap,

      inputFormatters: widget.inputFormatters,

      style: AppTextStyles.bodyLarge,

      decoration: InputDecoration(
        hintText: widget.hintText,

        labelText: widget.labelText,

        hintStyle: AppTextTheme.light.bodyMedium?.copyWith(
          color: context.colors.onSurface.withValues(alpha: .5),
        ),

        labelStyle: AppTextTheme.light.bodyMedium,

        filled: true,

        fillColor: widget.fillColor ?? context.surface,

        prefixIcon: widget.prefixIcon,

        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },

                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : widget.suffixIcon,

        // contentPadding:
        //     widget.contentPadding ??
        //     EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),

        // border: _border(),

        // enabledBorder: _border(),

        // focusedBorder: _border(color: context.primary),

        // errorBorder: _border(color: context.error),

        // focusedErrorBorder: _border(color: context.error),
      ).copyWith(fillColor: widget.fillColor),
    );
  }


}
