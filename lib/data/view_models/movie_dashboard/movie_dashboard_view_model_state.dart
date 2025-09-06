part of 'movie_dashboard_view_model.dart';

class MovieDashboardViewModelState extends Equatable {
  final PageStatus pageStatus;
  final MovieDataModel? movieDataModel;

  const MovieDashboardViewModelState({
    this.pageStatus = PageStatus.initial,
    this.movieDataModel,
  });

  @override
  List<Object?> get props => [
        pageStatus,
    movieDataModel
      ];

  MovieDashboardViewModelState copyWith({
    PageStatus? pageStatus,
    MovieDataModel? movieDataModel,
  }) {
    return MovieDashboardViewModelState(
      pageStatus: pageStatus ?? this.pageStatus,
        movieDataModel: movieDataModel ?? this.movieDataModel
    );
  }
}
