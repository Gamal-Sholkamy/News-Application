import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/states.dart';
import 'package:news/network/dio_helper.dart';
import 'package:news/screens/settings.dart';
import '../screens/business_screen.dart';
import '../screens/sciences_screen.dart';
import '../screens/sports_screen.dart';
import 'package:news/network/cache_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() :super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List screens = [ BusinessScreen(), SportsScreen(), Sciencescreen(),];
  List titles = [
    "Business News",
    "Sports News",
    "Sciences News",
  ];

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(NewsBottomNavBarState());
  }

  /////////Business///////////
  List<dynamic> business = [];

  void getBusinessNews() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'a17fe27336c340c0b963635acb5dae46',
      },
    ).then((value) {
      print('dio value ::: ${value.data}');
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
      //print(value.data.toString());
    }).catchError((error) {
      print('dio error ::: $error');
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

///////////Sports/////////
  List<dynamic> sports = [];

  void getSportsNews() {
    emit(NewsGetSportsLoadingState());
    if (sports.length > 1) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'a17fe27336c340c0b963635acb5dae46',
        },
      ).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessState());
        //print(value.data.toString());
      }).catchError((error) {
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }
    else {
      emit(NewsGetSportsSuccessState(),);
    }
  }

  //////////Sciences///////
  List<dynamic> sciences = [];

  void getSciencesNews() {
    emit(NewsGetSciencesLoadingState());
    if (sciences.length > 1) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sciences',
          'apiKey': 'a17fe27336c340c0b963635acb5dae46',
        },
      ).then((value) {
        sciences = value.data['articles'];
        emit(NewsGetSciencesSuccessState());
        //print(value.data.toString());
      }).catchError((error) {
        emit(NewsGetSciencesErrorState(error.toString()));
      });
    }
    else {
      emit(NewsGetSciencesSuccessState(),);
    }
  }

  //////////App Mode///////////
  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    }
    else {
      isDark = !isDark;
    }

    CacheHelper.setData(key: 'isDark', value: isDark).then((value) {
      emit(NewsChangeAppModeState());
    });
  }

//////////////search///////////
  List<dynamic> search = [];

  void getSearch(String value) {
    search = [];
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {

        'q': value,
        'apiKey': 'a17fe27336c340c0b963635acb5dae46',
      },
    ).then((value) {
      search = value.data['articles'];
      NewsGetSportsSuccessState();
      //print(value.data.toString());
    }).catchError((error) {
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}