import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/cubit.dart';
import 'package:news/cubit/states.dart';
import 'package:news/network/dio_helper.dart';
import 'package:news/screens/search_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit newsCubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(newsCubit.titles[newsCubit.currentIndex]),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>SearchScreen(),));
                    },
                    icon:  Icon(
                      Icons.search,
                      color: Colors.deepOrange[900],
                    )),
                IconButton(
                    onPressed: () {
                     newsCubit.changeAppMode();
                    },
                    icon:  Icon(
                      Icons.brightness_6_outlined,
                     color: Colors.deepOrange[900],
                    )),
              ],
            ),
            body: newsCubit.screens[newsCubit.currentIndex],

            bottomNavigationBar: BottomNavigationBar(

              onTap: (index) {
                newsCubit.changeBottomNavIndex(index);
                if(index==1){newsCubit.getSportsNews();}
                if(index==2){newsCubit.getSciencesNews();}
              },
              currentIndex: newsCubit.currentIndex,
              items: const [
                BottomNavigationBarItem(
                  label: "Business",
                  icon: Icon(Icons.business_center_sharp),
                ),
                BottomNavigationBarItem(
                  label: "Sports",
                  icon: Icon(Icons.sports_soccer_outlined),
                ),
                BottomNavigationBarItem(
                  label: "Sciences",
                  icon: Icon(Icons.science_outlined),
                ),

              ],
            ),
          );
        },
      );

  }
}
