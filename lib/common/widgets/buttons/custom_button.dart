import 'package:flutter/material.dart';
import 'package:shop_application/core/configs/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed:onPressed,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      minWidth: double.infinity,
      height: 47,
      color: AppColors.primary,
      child: Text(text,style:const TextStyle(fontSize: 20),),
    );
  }
}
