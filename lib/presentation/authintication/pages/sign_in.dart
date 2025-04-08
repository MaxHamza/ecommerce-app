import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop_application/common/helper/navigations/app_navigator.dart';
import 'package:shop_application/common/widgets/custom_rich_text.dart';
import 'package:shop_application/core/configs/theme/app_colors.dart';
import 'package:shop_application/common/widgets/buttons/custom_button.dart';
import 'package:shop_application/common/widgets/custom_title.dart';
import '../../../common/widgets/custom_text_field.dart';
import 'enter_password.dart';
class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(padding: EdgeInsets.symmetric(
        vertical: height*0.1,
        horizontal: width*0.04,
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        const    CustomTitle(text: 'Sign In',style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: height*0.02,),
          const  CustomTextField(hide: false, hint: 'Email Address',keyboardType: TextInputType.emailAddress,),
            SizedBox(height: height*0.02,),
             CustomButton(text: 'Continue',onPressed: (){
              AppNavigator.route(context, const EnterPassword());
             },),
            SizedBox(height: height*0.02,),
          const  CustomRichText(title1: 'Don\'t have an Account? ',
            title2: 'Create one',
            )
          ],
        ),
      ),
    );
  }
}
