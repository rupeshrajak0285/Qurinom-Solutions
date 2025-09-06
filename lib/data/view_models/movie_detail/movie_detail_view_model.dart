import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../common_libraries.dart';

part 'movie_detail_view_model_event.dart';
part 'movie_detail_view_model_state.dart';

class MovieDetailViewModel extends Bloc<MovieDetailViewModelEvent, MovieDetailViewModelState> {
  final BuildContext context;
  final String movieId;
  late MovieRepository repository;
  MovieDetailViewModel(this.context, this.movieId) : super(const MovieDetailViewModelState()) {
    repository = RepositoryProvider.of(context);
    on<MovieDetailViewModelMovieDetailLoaded>(_onMovieDetailViewModelMovieDetailLoaded);
    add(MovieDetailViewModelMovieDetailLoaded());
  }
  Future<void> _onMovieDetailViewModelMovieDetailLoaded(
      MovieDetailViewModelMovieDetailLoaded event,
      Emitter<MovieDetailViewModelState> emit) async {
    try {
      emit(state.copyWith(pageStatus: PageStatus.loading));
      var response = await repository.getMovieDetail(movieId);
      emit(state.copyWith(pageStatus: PageStatus.success, movieDetailModel: response));

    } catch (ex) {
      emit(state.copyWith(pageStatus: PageStatus.success));
      AppToaster(
        context: context,
        notifyType: AppNotifyType.error,
        content: ex.toString(),
      ).show();
    }
  }
}
