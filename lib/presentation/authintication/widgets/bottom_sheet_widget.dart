import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/presentation/authintication/bloc/get_ages_cubit.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocBuilder<GetAgesCubit, GetAgesState>(
  builder: (context, state) {
     if (state is GetAgesFailure) {
      return Center(
        child: Text(state.message),
      );
    }
    else if(state is GetAgesLoaded) {
      return Container(
        height: height / 2.7,
        width: width,
        decoration: BoxDecoration(
            color: Color(0xFF2C2C3E),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            )),
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView.separated(
              itemBuilder: (context,index){
                return Text(state.query[index].data()['value']);
              },
              separatorBuilder: (context,state){
                return SizedBox(height: height*0.02,);
              },
              itemCount: state.query.length),
        ),
      );
    }
     else{
       return Center(
         child: CircularProgressIndicator(),
       );
     }
  }
);
  }
}
