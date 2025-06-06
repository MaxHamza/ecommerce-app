import 'package:flutter/material.dart';
import 'package:shop_application/presentation/authintication/pages/forgot_password.dart';
import '../../../common/helper/navigations/app_navigator.dart';
import '../../../common/widgets/appBar/basic_app_bar.dart';
import '../../../common/widgets/buttons/custom_button.dart';
import '../../../common/widgets/custom_rich_text.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../common/widgets/custom_title.dart';
import '../../../core/configs/theme/app_colors.dart';
class EnterPassword extends StatelessWidget {
   EnterPassword({super.key});
  TextEditingController passCon=TextEditingController();
  @override
    Widget build(BuildContext context) {
      double width=MediaQuery.of(context).size.width;
      double height=MediaQuery.of(context).size.height;
      return  Scaffold(
       appBar: const BasicAppbar(),
        backgroundColor: AppColors.background,
        body: Padding(padding: EdgeInsets.symmetric(
          vertical: height*0.03,
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
                CustomTextField(
              controller: passCon,
                hide: false, hint: 'Password',keyboardType: TextInputType.emailAddress,),
              SizedBox(height: height*0.02,),
              CustomButton(text: 'Continue',onPressed: (){
                AppNavigator.pushReplacement(context, EnterPassword());
              },),
              SizedBox(height: height*0.02,),
                CustomRichText(title1: 'Forgot Password? ',
                title2: 'Reset',
                ontTap: (){
                AppNavigator.push(context, ForgotPassword());
                },
              )
            ],
          ),
        ),
      );
    }
}
