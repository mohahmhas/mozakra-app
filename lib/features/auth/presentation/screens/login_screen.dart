import 'package:e_store/core/generated/app_assets.dart';
import 'package:e_store/core/router/routes.dart';
import 'package:e_store/core/shared/helpers/extensions.dart';
import 'package:e_store/core/shared/widgets/app_button.dart';
import 'package:e_store/core/shared/widgets/app_text_form_field.dart';
import 'package:e_store/core/shared/widgets/title_app.dart';
import 'package:e_store/core/theme/tokens/app_colors.dart';
import 'package:e_store/core/theme/tokens/app_spacing.dart';
import 'package:e_store/core/theme/app_text_styles.dart';
import 'package:e_store/core/translations/locale_keys.dart';
import 'package:e_store/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:e_store/features/auth/presentation/widgets/social_auth_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitLogin() {
    FocusScope.of(context).unfocus();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      return;
    }
    context.read<LoginCubit>().login(email: email, password: password);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          context.go(Routes.mainLayout);
        }
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space20),
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                final isLoading = state is LoginLoading;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.xxxl),

                    const Center(child: TitleApp()),
                    const SizedBox(height: AppSpacing.space32),
                    Text(
                      LocaleKeys.welcomeBack.tr(),
                      style: AppTextStyles.headlineLarge.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.space4),
                    Text(
                      LocaleKeys.loginToContinue.tr(),
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.space32),
                    Text(
                      LocaleKeys.emailOrPhoneNumber.tr(),
                      style: AppTextStyles.title18SemiBlod.copyWith(
                        color: context.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.space8),
                    AppTextFormField(
                      hintText: 'example@email.com',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      borderColor: AppColors.lightGrey,
                    ),
                    const SizedBox(height: AppSpacing.space24),
                    Text(
                      LocaleKeys.password.tr(),
                      style: AppTextStyles.title18SemiBlod.copyWith(
                        color: context.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.space8),
                    AppTextFormField(
                      hintText: LocaleKeys.enterYourPassword.tr(),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      borderColor: AppColors.lightGrey,
                      obscureText: true,
                    ),
                    const SizedBox(height: AppSpacing.space24),
                    InkWell(
                      onTap: () {
                        // Handle forgot password tap
                        GoRouter.of(context).push(Routes.forgotPassword);
                      },
                      child: Text(
                        LocaleKeys.forgotPassword.tr(),
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: context.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.space24),
                    AppButton(
                      text: LocaleKeys.signIn.tr(),
                      onPressed: isLoading ? null : _submitLogin,
                    ),
                    const SizedBox(height: AppSpacing.space32),
                    Center(
                      child: Text(
                        LocaleKeys.or.tr(),
                        style: AppTextStyles.title12Blod,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.space41),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialAuthButton(
                          title: LocaleKeys.apple.tr(),
                          iconPath: AppAssets.webPIosIcon,
                          backgroundColor: AppColors.white,
                          borderColor: AppColors.lightGrey,

                          onPressed: () {
                            // Handle Google sign-in
                          },
                        ),
                        SocialAuthButton(
                          title: LocaleKeys.google.tr(),
                          iconPath: AppAssets.webPGoogle,

                          onPressed: () {
                            // Handle Google sign-in
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
