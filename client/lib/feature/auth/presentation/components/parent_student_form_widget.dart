import 'package:client/core/components/animated_button.dart';
import 'package:client/core/components/animation_switch.dart';
import 'package:client/core/components/text_form_field.dart';
import 'package:client/core/extensions/context_extension.dart';
import 'package:client/core/extensions/validation_extension.dart';
import 'package:client/core/helpers/decoration.dart';
import 'package:client/core/helpers/icons_helpers.dart';
import 'package:client/core/utils/app_images.dart';
import 'package:client/core/utils/app_palettes.dart';
import 'package:client/core/utils/dimens.dart';
import 'package:client/feature/auth/domain/params/login_params.dart';
import 'package:client/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:client/feature/auth/presentation/cubit/login_cubit/login_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/login_fields.dart';
import '../cubit/login_cubit/login_form_state.dart';

class ParentStudentFormWidget extends StatelessWidget {
  const ParentStudentFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = context.localizations;
    final textTheme = context.textTheme;
    final formBloc = context.read<LoginFormCubit>();

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        spacing: Dimens.widgetSpacing,
        children: [
          Container(
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
            child: Form(
              key: formBloc.state.formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                spacing: Dimens.widgetSpacing,
                children: [
                  Text(
                    localization.parent_and_student_portal,
                    style: textTheme.titleMedium,
                  ),
                  CommonTextFormField(
                    name: LoginFields.identifier,
                    labelText: localization.student_id_admission_number,
                    hintText: "ABC-10-A",
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

                        keyboardType: TextInputType.text,
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
                  BlocSelector<AuthBloc, AuthState, bool>(
                    selector: (state) => state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    ),
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
                                    formBloc.values[LoginFields.password]
                                        as String,
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
                    child: Text(
                      localization.parent_student_sign_in_info,
                      textAlign: TextAlign.center,
                      style: textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
