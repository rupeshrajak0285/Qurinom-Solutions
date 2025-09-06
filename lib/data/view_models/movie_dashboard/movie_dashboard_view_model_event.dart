part of 'movie_dashboard_view_model.dart';

 class MovieDashboardViewModelEvent {}

class MovieDashboardViewModelMovieListLoaded extends MovieDashboardViewModelEvent{
  final String searchKey;
  MovieDashboardViewModelMovieListLoaded({this.searchKey =""});
}