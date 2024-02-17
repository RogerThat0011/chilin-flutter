import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/spacing_styles.dart';

import '../../../common/widgets/login_signup/form_divider.dart';
import '../../../common/widgets/login_signup/login_footer.dart';
import '../../../common/widgets/login_signup/login_form.dart';
import '../../../common/widgets/login_signup/login_header.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const TLoginHeader(),

              //FORM
              const TLoginForm(),

              //DIVIDER
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!,),

              const SizedBox(height: TSizes.spaceBtwSections),

              //FOOTER
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
