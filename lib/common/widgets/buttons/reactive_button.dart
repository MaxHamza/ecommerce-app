import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/common/helper/bloc/reactive_buttons_cubit.dart';
import 'package:shop_application/common/helper/bloc/reactive_buttons_cubit.dart';

import 'custom_button.dart';

class ReactiveButton extends StatelessWidget{
  ReactiveButton({required this.color, required this.title, this.onPressed});
  final Color color;
  final String title;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<ReactiveButtonsCubit, ReactiveButtonsState>(
  builder: (context, state) {
    if (state is ReactiveButtonsLoading) {
      return Container(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.03,
            horizontal: width * 0.03,
          ),
          height: height * 0.13,
          color: color,
          child: Center(
            child: CircularProgressIndicator(),
          )
      );
    }
    else if (state is ReactiveButtonsFailure) {
      print(state.message);
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.03,
        ),
        height: height * 0.13,
        color: color,
        child: CustomButton(
          text: title,
          onPressed: onPressed,
        ),
      );
    }
    else if(state is ReactiveButtonsSuccess){
      print('success');
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.03,
        ),
        height: height * 0.13,
        color: color,
        child: CustomButton(
          text: title,
          onPressed: onPressed,
        ),
      );
    }
    else {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.03,
        ),
        height: height * 0.13,
        color: color,
        child: CustomButton(
          text: title,
          onPressed: onPressed,
        ),
      );
    }
  }
);
  }
  
}