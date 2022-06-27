import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'design_item.dart';

class Sciencescreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    bool isSearch=false;
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        List<dynamic>  list=NewsCubit.get(context).sciences;
        return ConditionalBuilder(

          condition: state is! NewsGetSciencesLoadingState,
          builder:(context)=> ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=>DesignItem(list[index],isSearch),
              separatorBuilder:(context,index)=>Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(width: double.infinity,
                  height: 1,color: Colors.black38,

                ),
              ) ,
              itemCount: list.length),
          fallback:(context)=> const Center(child: CircularProgressIndicator()),

        );
      },
    );
  }
}