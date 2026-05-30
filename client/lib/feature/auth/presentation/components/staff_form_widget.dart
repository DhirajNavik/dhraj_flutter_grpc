import 'package:client/core/components/animated_button.dart';
import 'package:client/core/components/animation_switch.dart';
import 'package:client/core/components/text_form_field.dart';
import 'package:client/core/extensions/context_extension.dart';
import 'package:client/core/extensions/validation_extension.dart';
import 'package:client/core/helpers/common_helpers.dart';
import 'package:client/core/helpers/decoration.dart';
import 'package:client/core/helpers/icons_helpers.dart';
import 'package:client/core/utils/app_images.dart';
import 'package:client/core/utils/app_palettes.dart';
import 'package:client/core/utils/dimens.dart';
import 'package:client/feature/auth/domain/params/login_params.dart';
import 'package:client/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:client/feature/auth/presentation/cubit/login_cubit/login_form_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../utils/login_fields.dart';
import '../cubit/login_cubit/login_form_cubit.dart';

class StaffFormWidget extends StatelessWidget {
  const StaffFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;
    final textTheme = context.textTheme;
    final formBloc = context.read<LoginFormCubit>();
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        decoration: boxDecorationRoundedWithShadow(
          Dimens.radiusX2,
          disabletopRadius: true,
          backgroundColor: AppPalettes.whiteColor,
          spreadRadius: 2,
          border: Border(
            top: BorderSide(color: AppPalettes.shadowColor, width: 2),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: Dimens.horizontalspacing),
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.horizontalspacing,
          vertical: Dimens.verticalspacing,
        ),
        child: FormBuilder(
          key: formBloc.state.formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Column(
            spacing: Dimens.widgetSpacing,
            children: [
              Text(localization.staff_portal, style: textTheme.titleMedium),

              Column(
                spacing: Dimens.widgetSpacing,
                children: [
                  CommonTextFormField(
                    name: LoginFields.identifier,
                    labelText: localization.email_teacher_id,
                    hintText: "example@gmail.com or UserName",
                    focus: formBloc.state.emailFocus,
                    nextFocus: formBloc.state.passwordFocus,
                    keyboardType: TextInputType.emailAddress,
                    validator: FormValidators.validateEmail,
                  ),
                  BlocSelector<LoginFormCubit, LoginFormState, bool>(
                    selector: (state) => state.isPasswordObscured,
                    builder: (_, state) {
                      return CommonTextFormField(
                        name: LoginFields.password,
                        labelText: localization.password,
                        focus: formBloc.state.passwordFocus,
                        hintText: localization.enter_password,
                        isPassword: state,
                        suffixIcon: AnimationSwitch(
                          child: Container(
                            key: ValueKey(state),
                            child: IconsHelpers.eyeIcon(
                              state
                                  ? AppImages.eyeSlashIcon
                                  : AppImages.eyeIcon,
                              onTap: formBloc.togglePasswordVisibility,
                            ),
                          ),
                        ),
                        validator: FormValidators.passwordValidator(),
                      );
                    },
                  ),
                ],
              ),

              BlocSelector<AuthBloc, AuthState, bool>(
                selector: (state) =>
                    state.maybeWhen(loading: () => true, orElse: () => false),
                builder: (_, value) {
                  return CommonButton(
                    isLoading: value,
                    isEnable: !value,
                    text: localization.sign_in,
                    onTap: () async {
                      if (!formBloc.validateLogin()) return;
                      context.read<AuthBloc>().add(
                        AuthEvent.loginSubmitted(
                          LoginParams(
                            identifier:
                                formBloc.values[LoginFields.identifier]
                                    as String,
                            password:
                                formBloc.values[LoginFields.password] as String,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimens.allPaddingX4,
                  vertical: Dimens.allPaddingX3,
                ),
                decoration: boxDecorationRoundedWithShadow(
                  Dimens.radiusX2,
                  backgroundColor: AppPalettes.liteGreyColor,
                  spreadRadius: 1,
                ),
                child: Column(
                  spacing: Dimens.gapX1B,
                  crossAxisAlignment: .center,
                  children: [
                    Row(
                      mainAxisSize: .max,
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "${localization.admin} : ",
                          style: textTheme.titleSmall,
                        ),
                        CommonHelpers.buildOneLineText(
                          localization.use_your_email_address,
                          style: textTheme.labelLarge,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: .max,
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "${localization.teacher} : ",
                          style: textTheme.titleSmall,
                        ),
                        CommonHelpers.buildOneLineText(
                          localization.use_your_teacher_id,
                          style: textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
