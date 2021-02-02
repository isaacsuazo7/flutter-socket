
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable(nullable:true)
class Team{
 final String id;
 final String name;
 final int votes;

  Team({this.id, this.name, this.votes});

  
    factory Team.fromJson(Map<String, dynamic> json) =>
      _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}