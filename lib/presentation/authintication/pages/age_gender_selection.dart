import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/common/widgets/buttons/custom_button.dart';
import 'package:shop_application/presentation/authintication/bloc/age_selection_cubit.dart';
import 'package:shop_application/presentation/authintication/bloc/gender_cubit.dart';
import '../../../core/configs/theme/app_colors.dart';

class AgeGenderSelection extends StatelessWidget {
  const AgeGenderSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final gender = context.select((GenderCubit cubit) => cubit.gender);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                              color: state == 0 ? AppColors.primary : const Color(
                                  0xFF2C2C3E),
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
                              color: state== 1 ? AppColors.primary : Color(
                                  0xFF2C2C3E),
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
                     return DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: state,
                      labelStyle:const TextStyle(color: Colors.white),
                      filled: true,
                      fillColor:const Color(0xFF2C2C3E), // dark purple background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30), // rounded corners
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                    dropdownColor: const Color(0xFF2C2C3E), // dropdown background
                    iconEnabledColor: Colors.white,   // dropdown arrow color
                    style:const TextStyle(color: Colors.white),
                    value: null,
                    items: ['18-25', '26-35', '36-45', '46+']
                        .map((age) => DropdownMenuItem(value: age, child: Text(age)))
                        .toList(),
                    onChanged: (value) {
                      // handle selection
                    },
                  );
  },
)

                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: height * 0.03,
                horizontal: width * 0.03,
              ),
              height: height * 0.13,
              color: Color(0xFF2C2C3E),
              child: CustomButton(
                text: 'Finish',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
