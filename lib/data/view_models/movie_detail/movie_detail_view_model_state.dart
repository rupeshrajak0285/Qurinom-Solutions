part of 'movie_detail_view_model.dart';


class MovieDetailViewModelState extends Equatable {
 final PageStatus pageStatus;
 final MovieDetailModel movieDetailModel;
 final bool isFavorite;
 final bool isInWatchlist;
 final String? errorMessage;

 const MovieDetailViewModelState({
  this.pageStatus = PageStatus.initial,
  this.movieDetailModel = const MovieDetailModel(),
  this.isFavorite = false,
  this.isInWatchlist = false,
  this.errorMessage,
 });

 @override
 List<Object?> get props => [
  pageStatus,
  movieDetailModel,
  isFavorite,
  isInWatchlist,
  errorMessage
 ];

 MovieDetailViewModelState copyWith({
  PageStatus? pageStatus,
  MovieDetailModel? movieDetailModel,
  bool? isFavorite,
  bool? isInWatchlist,
  String? errorMessage,
 }) {
  return MovieDetailViewModelState(
   pageStatus: pageStatus ?? this.pageStatus,
      movieDetailModel : movieDetailModel ?? this.movieDetailModel,
   isFavorite: isFavorite ?? this.isFavorite,
   isInWatchlist: isInWatchlist ?? this.isInWatchlist,
   errorMessage: errorMessage ?? this.errorMessage,
  );
 }
}
