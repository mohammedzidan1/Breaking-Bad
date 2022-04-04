import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../../data/model/characters_model.dart';
import '../../data/model/quote.dart';
import '../../data/reporesntly/characters_reposently.dart';
part 'charactars_state.dart';

class CharactarsCubit extends Cubit<CharactarsState> {

  final CharactersReposently charactersReposently;

  CharactarsCubit(this.charactersReposently) : super(CharactarsInitial());

static CharactarsCubit get(context) => BlocProvider.of(context);
  List<Character> characters=[];
 void getAllCaracters() {
    emit(CharactarsLoding());
    charactersReposently.getAllCharacters().then((characters) {
     this. characters = characters;
      print(characters[1].nickName);
      emit(CharactarsSucsses(characters));
     
    });
   
  }
  List<Quote> quote=[];
   void getQuotes(String charName) {
    charactersReposently.getCharacterQuotes(charName).then((quotes) {
      quote=quotes;
      emit(QuotesLoaded(quotes));
    });
  }
}
