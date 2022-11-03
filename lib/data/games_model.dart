import 'package:hive/hive.dart';

part 'games_model.g.dart';

@HiveType(typeId: 1)
class Game extends HiveObject {
  Game({
    required this.title ,
    required this.date ,
    required this.playersCount,
    this.imagePath,
    this.description
  });

  @HiveField(0)
  String title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  String? imagePath;

  @HiveField(4)
  String playersCount;
}