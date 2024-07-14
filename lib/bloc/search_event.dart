abstract class SearchEvent {}

final class SearchWord extends SearchEvent {
  final String word;
  SearchWord(this.word);
}
