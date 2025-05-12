import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/common/helper/bloc/reactive_buttons_cubit.dart';
import 'package:shop_application/common/helper/navigations/app_navigator.dart';
import 'package:shop_application/common/widgets/appBar/basic_app_bar.dart';
import 'package:shop_application/common/widgets/custom_rich_text.dart';
import 'package:shop_application/core/configs/theme/app_colors.dart';
import 'package:shop_application/common/widgets/buttons/custom_button.dart';
import 'package:shop_application/common/widgets/custom_title.dart';
import 'package:shop_application/data/auth/models/create_user.dart';
import 'package:shop_application/presentation/authintication/bloc/age_selection_cubit.dart';
import 'package:shop_application/presentation/authintication/bloc/get_ages_cubit.dart';
import 'package:shop_application/presentation/authintication/pages/age_gender_selection.dart';
import 'package:shop_application/presentation/authintication/pages/sign_in.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../bloc/gender_cubit.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});
  TextEditingController firstNameCon=TextEditingController();
  TextEditingController lastNameCon=TextEditingController();
  TextEditingController emailCon=TextEditingController();
  TextEditingController passCon=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const BasicAppbar(),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.04,
        ),
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTitle(
                text: 'Create Account',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
               CustomTextField(
                controller: firstNameCon,
                hide: false,
                hint: 'Firstname',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: height * 0.02,
              ),
               CustomTextField(
                 controller: lastNameCon,
                hide: false,
                hint: 'Lastname',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: height * 0.02,
              ),
               CustomTextField(
                controller:emailCon ,
                hide: false,
                hint: 'Email Address',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: height * 0.02,
              ),
               CustomTextField(
                 controller: passCon,
                hide: false,
                hint: 'Password',
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  AppNavigator.push(
                      context,
                      MultiBlocProvider(
                        providers: [
                          BlocProvider<ReactiveButtonsCubit>(
                            create: (context) => ReactiveButtonsCubit(),
                          ),
                          BlocProvider<GenderCubit>(
                              create: (context) => GenderCubit()),
                        ],
                        child: AgeGenderSelection(
                          userCreateReq: UserCreateReq(
                            firstName: firstNameCon.text,
                            lastName:lastNameCon.text ,
                            email: emailCon.text,
                            password: passCon.text,
                          ),
                        ),
                      ));
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomRichText(
                title1: 'Do you have an account? ',
                title2: 'SignIn',
                ontTap: () {
                  AppNavigator.pushReplacement(context,  SignIn());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
