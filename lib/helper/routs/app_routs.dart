import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bussnes_logic/cubit/charactars_cubit.dart';
import '../../data/model/characters_model.dart';
import '../../data/reporesntly/characters_reposently.dart';
import '../../data/web_services/characters_web_serves.dart';
import 'routes_names.dart';
import '../../presentation/screens/characters_details_screen.dart';
import '../../presentation/screens/characters_screen.dart';
class AppRouts{
   late CharactersReposently charactersRepository;
  late CharactarsCubit charactersCubit;

  AppRouts() {
    charactersRepository = CharactersReposently(CharactaesticWebServices());
    charactersCubit = CharactarsCubit(charactersRepository);
  }

  Route? genirateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutsNames.charctersScreens :
     
      return MaterialPageRoute(builder:(_)=> BlocProvider(
            create: (BuildContext contxt) => charactersCubit,
            child: CharactersScreen(),
          ));
           case RoutsNames.charactersDetailsScreens :
      final character = settings.arguments as Character ;
      return MaterialPageRoute(builder:(_)=> 
             BlocProvider(
               create: (context) => CharactarsCubit(charactersRepository),
               child: CharactersDetailsScreens(character: character,)),
          );
          
    }
  }
}
