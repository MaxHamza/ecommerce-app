import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/common/helper/bloc/reactive_buttons_cubit.dart';
import 'package:shop_application/common/helper/bottom_sheet/app_bottomsheet.dart';
import 'package:shop_application/common/widgets/buttons/custom_button.dart';
import 'package:shop_application/common/widgets/buttons/reactive_button.dart';
import 'package:shop_application/data/auth/models/create_user.dart';
import 'package:shop_application/presentation/authintication/bloc/age_selection_cubit.dart';
import 'package:shop_application/presentation/authintication/bloc/gender_cubit.dart';
import 'package:shop_application/presentation/authintication/bloc/get_ages_cubit.dart';
import '../../../core/configs/theme/app_colors.dart';
import '../../../domain/authintication/usecases/sign_up.dart';
import '../widgets/bottom_sheet_widget.dart';

class AgeGenderSelection extends StatelessWidget {
  const AgeGenderSelection({super.key, required this.userCreateReq,});
  final UserCreateReq userCreateReq;
  @override
  Widget build(BuildContext context) {
    final gender = context.select((GenderCubit cubit) => cubit.gender);
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: height * 0.2,
                left: width * 0.03,
                right: width * 0.03,
              ),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tell us About yourself',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Text('who do you shop for ?'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  BlocBuilder<GenderCubit, int>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              BlocProvider.of<GenderCubit>(context)
                                  .genderChange(0);
                            },
                            minWidth: 120,
                            height: 45,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                            color: state == 0
                                ? AppColors.primary
                                : const Color(0xFF2C2C3E),
                            child: Text('Man'),
                          ),
                          SizedBox(
                            width: width * 0.06,
                          ),
                          MaterialButton(
                            onPressed: () {
                              BlocProvider.of<GenderCubit>(context)
                                  .genderChange(1);
                            },
                            minWidth: 120,
                            height: 45,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                            child: Text('Women'),
                            color: state == 1
                                ? AppColors.primary
                                : Color(0xFF2C2C3E),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Text('How Old Are you ?'),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  BlocBuilder<AgeSelectionCubit, String>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<GetAgesCubit>(context).getAges();
                          AppBottomSheet.display(
                            context,
                            BottomSheetWidget(),
                          );
                        },
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: width * 0.02),
                          height: height * 0.06,
                          decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            color: Color(0xFF2C2C3E),
                          ),
                          child: Row(
                            children: [
                              Text(
                                state,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            const Spacer(),
            ReactiveButton(
              color:const Color(0xFF2C2C3E), title: 'Finish', onPressed: () {
                userCreateReq.gender=BlocProvider.of<GenderCubit>(context).gender;
                userCreateReq.age=BlocProvider.of<AgeSelectionCubit>(context).selectedAge;
              context.read<ReactiveButtonsCubit>().execute(useCases: SignUpUseCase(),
                  param:userCreateReq);
            },)
          ],
        ),
      ),
    );
  }
}
