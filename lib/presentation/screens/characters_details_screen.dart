import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bussnes_logic/cubit/charactars_cubit.dart';
import '../../data/model/characters_model.dart';
import '../../helper/my_colors.dart';

class CharactersDetailsScreens extends StatelessWidget {
  final Character? character;
  const CharactersDetailsScreens({Key? key, required this.character})
      : super(key: key);
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character!.nickName,
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character!.charId,
          child: Image.network(
            character!.image,
            //'https://www.wepal.net/ar/uploads/2732018-073911PM-1.jpg',

            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellw,
      thickness: 2,
    );
  }

 Widget checkIfQuotesAreLoaded(CharactarsState state) {
    if (state is QuotesLoaded) {
      return displayRandomQuoteOrEmptySpace(state);
    } else {
      return showProgressIndicator();
    }
  }

  Widget displayRandomQuoteOrEmptySpace(state) {
    var quotes = (state).quotes;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child:  DefaultTextStyle(
          
    style: const TextStyle(
      fontSize: 20.0,
      //fontFamily: 'Canterbury',
    ),
    child: AnimatedTextKit(
      displayFullTextOnTap: true, repeatForever: true,
      animatedTexts: [
        ScaleAnimatedText(quotes[randomQuoteIndex].quote),
      
      ],
      onTap: () {
        print("Tap Event");
      },
    ),
  ),
      );
    } else {
      return Container();
    }
  }

  Widget showProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellw,
      ),
    );
  }


 

  @override
  Widget build(BuildContext context) {
        BlocProvider.of<CharactarsCubit>(context).getQuotes(character!.name);

    return Scaffold(
        backgroundColor: MyColors.myGrey,
        body: CustomScrollView(slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                    margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                    padding: EdgeInsets.all(8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          characterInfo('Job : ', character!.jobs.join(' / ')),
                          buildDivider(315),
                          characterInfo('Appeared in : ',
                              character!.categoryForTwoSeries),
                          buildDivider(250),
                          characterInfo('Seasons : ',
                              character!.appearanceOfSeasons.join(' / ')),
                          buildDivider(280),
                          characterInfo(
                              'Status : ', character!.statusIfDeadOrAlive),
                          buildDivider(300),
                          character!.betterCallSaulAppearance.isEmpty
                              ? Container()
                              : Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      characterInfo(
                                          'Better Call Saul Seasons : ',
                                          character!.betterCallSaulAppearance
                                              .join(" / ")),
                                      buildDivider(150),
                                    ],
                                  ),
                                ),
                          characterInfo(
                              'Actor/Actress : ', character!.acotrName),
                          buildDivider(235),

BlocBuilder<CharactarsCubit,CharactarsState>(builder: ((context, state) {
return checkIfQuotesAreLoaded(state);
}),
  
),

                          SizedBox(height: 500,),

                        ]))
              ],
            ),
          ),
        
        ]));
  }
}
