import 'package:flutter/material.dart';
import 'package:shop_application/common/widgets/appBar/basic_app_bar.dart';
import '../../../common/helper/navigations/app_navigator.dart';
import '../../../common/widgets/buttons/custom_button.dart';
import '../../../common/widgets/custom_rich_text.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../common/widgets/custom_title.dart';
import '../../../core/configs/theme/app_colors.dart';
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
            const    CustomTitle(text: 'Forgot Password',style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: height*0.02,),
            const  CustomTextField(hide: false, hint: 'Enter Email Address',keyboardType: TextInputType.emailAddress,),
            SizedBox(height: height*0.02,),
            CustomButton(text: 'Continue',onPressed: (){
              //AppNavigator.pushReplacement(context,const EnterPassword());
            },),
          ],
        ),
      ),
    );
  }
}
