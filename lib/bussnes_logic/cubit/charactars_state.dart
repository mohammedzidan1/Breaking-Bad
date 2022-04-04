part of 'charactars_cubit.dart';

@immutable
abstract class CharactarsState {}

class CharactarsInitial extends CharactarsState {}

class CharactarsSucsses extends CharactarsState {
  final List<Character> chracters;

  CharactarsSucsses(this.chracters);
}

class CharactarsLoding extends CharactarsState {}
class QuotesLoaded extends CharactarsState {
  final List<Quote> quotes;

  QuotesLoaded(this.quotes);
}