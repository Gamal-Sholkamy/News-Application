abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class NewsBottomNavBarState extends NewsStates{}

class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates{}
class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetSciencesLoadingState extends NewsStates{}
class NewsGetSciencesSuccessState extends NewsStates{}
class NewsGetSciencesErrorState extends NewsStates {
  final String error;

  NewsGetSciencesErrorState(this.error);
}

class NewsChangeAppModeState extends NewsStates{}

class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates {
  final String error;

  NewsGetSearchErrorState(this.error);
}