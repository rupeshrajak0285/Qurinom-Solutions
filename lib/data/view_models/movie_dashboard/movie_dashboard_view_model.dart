import '../../../common_libraries.dart';

part 'movie_dashboard_view_model_event.dart';

part 'movie_dashboard_view_model_state.dart';

class MovieDashboardViewModel
    extends Bloc<MovieDashboardViewModelEvent, MovieDashboardViewModelState> {
  final BuildContext context;
  late MovieRepository repository;

  MovieDashboardViewModel(this.context)
      : super(const MovieDashboardViewModelState()) {
    repository = RepositoryProvider.of(context);
    on<MovieDashboardViewModelMovieListLoaded>(_onMovieDashboardViewModelMovieListLoaded);

  add(MovieDashboardViewModelMovieListLoaded());
  }

  Future<void> _onMovieDashboardViewModelMovieListLoaded(
      MovieDashboardViewModelMovieListLoaded event,
      Emitter<MovieDashboardViewModelState> emit) async {
    try {
      emit(state.copyWith(pageStatus: PageStatus.loading));
      var response = await repository.searchMovies(event.searchKey);
      emit(state.copyWith(pageStatus: PageStatus.success, movieDataModel: response));

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
