import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/screens/design_item.dart';

class BusinessScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    bool isSearch=false;
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        List<dynamic>  list=NewsCubit.get(context).business;
        print('business state ::: $state');
        return ConditionalBuilder(

          condition: state is! NewsGetBusinessLoadingState,
          builder:(context)=> ListView.separated(
            physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=>DesignItem(list[index],isSearch),
              separatorBuilder:(context,index)=>Container(width: double.infinity,
                height: 1,color: Colors.black38,

              ) ,
              itemCount: list.length),
          fallback:(context)=> const Center(child: CircularProgressIndicator()),

        );
      },
    );
  }
}