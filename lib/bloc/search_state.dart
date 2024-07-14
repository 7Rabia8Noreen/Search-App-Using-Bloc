abstract class SearchState {}

final class InitialState extends SearchState {}

final class LoadingState extends SearchState {}

final class LoadedState extends SearchState {
  final List<String> words;
  LoadedState(this.words);
}
