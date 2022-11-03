import 'package:games/utilities/utilities.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/games_model.dart';
import 'constante.dart';

class Database{

  static Box? box ;
  static Box? box1 ;

  static initDB() async {
    Hive.registerAdapter<Game>(GameAdapter());
     box = await Hive.openBox<Game>('games');
     box1 = await Hive.openBox('storage');
     if(box1!.get(AppConstant.local) == null){
       box1!.put(AppConstant.local, "en");
     }

  }

  static addGame(Game game){
    box!.add(game);
    print('games added');
    toastMe('game added succefuly');
  }

  static updateGame(Game game){
    game.save();
  }

  static deleteGame(Game game){
      game.delete();
  }

  static List<Game> getGames(){
    List<Game> games = [] ;
    if(box!.values.isNotEmpty){
      for(var i in box!.values){
        games.add(i);
      }
    }
    print(games.length);
    return games;
  }

  static Game getGameByName(String title){
    Game game = getGames().firstWhere((element) => element.title == title);
    return game;
  }

  static List<Game> sortByName(){
    List<Game> games = getGames();
    games.sort((a,b) => a.title.compareTo(b.title));
    games.forEach((element) {
      print(element.title);
    });
    return games;
  }

  static List<Game> sortByDate() {
    List<Game> games = getGames();
    games.sort((a,b) => a.date.compareTo(b.date));
    games.forEach((element) {
      print(element.title);
    });
    return games;
  }




}