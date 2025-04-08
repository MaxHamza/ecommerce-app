import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop_application/common/helper/navigations/app_navigator.dart';
import 'package:shop_application/common/widgets/appBar/basic_app_bar.dart';
import 'package:shop_application/common/widgets/custom_rich_text.dart';
import 'package:shop_application/core/configs/theme/app_colors.dart';
import 'package:shop_application/common/widgets/buttons/custom_button.dart';
import 'package:shop_application/common/widgets/custom_title.dart';
import 'package:shop_application/presentation/authintication/pages/sign_in.dart';
import '../../../common/widgets/custom_text_field.dart';
import 'forgot_password.dart';
class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar:const BasicAppbar(),
      backgroundColor: AppColors.background,
      body: Padding(padding: EdgeInsets.symmetric(
        vertical: height*0.03,
        horizontal: width*0.04,
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const    CustomTitle(text: 'Create Account',style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: height*0.02,),
            const  CustomTextField(hide: false, hint: 'Firstname',keyboardType: TextInputType.emailAddress,),
            SizedBox(height: height*0.02,),
            const  CustomTextField(hide: false, hint: 'Lastname',keyboardType: TextInputType.emailAddress,),
            SizedBox(height: height*0.02,),
            const  CustomTextField(hide: false, hint: 'Email Address',keyboardType: TextInputType.emailAddress,),
            SizedBox(height: height*0.02,),
            const  CustomTextField(hide: false, hint: 'Password',keyboardType: TextInputType.emailAddress,),
            SizedBox(height: height*0.02,),
            CustomButton(text: 'Continue',onPressed: (){
           //   AppNavigator.push(context, const EnterPassword());
            },),
            SizedBox(height: height*0.02,),
            CustomRichText(title1: 'Do you have an account? ',
              title2: 'SignIn',
              ontTap: (){
                AppNavigator.pushReplacement(context,const SignIn());
              },
            )
          ],
        ),
      ),
    );
  }
}
