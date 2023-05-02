import 'package:json_annotation/json_annotation.dart';
part 'source.g.dart';

@JsonSerializable()
class Source{
    String? id;
    String? name;
    Source(
        this.id,
        this.name,
    );

  Source.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

    Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
