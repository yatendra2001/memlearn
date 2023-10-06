// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class PathModel extends Equatable {
  final String imageUrl;
  final String numberOfStages;
  final String numberOfLevels;
  final String type;
  final String pathTitle;
  final String pathDescription;
  final String currentLevel;
  const PathModel({
    required this.imageUrl,
    required this.numberOfStages,
    required this.numberOfLevels,
    required this.type,
    required this.pathTitle,
    required this.pathDescription,
    required this.currentLevel,
  });

  PathModel copyWith({
    String? imageUrl,
    String? numberOfStages,
    String? numberOfLevels,
    String? type,
    String? pathTitle,
    String? pathDescription,
    String? currentLevel,
  }) {
    return PathModel(
      imageUrl: imageUrl ?? this.imageUrl,
      numberOfStages: numberOfStages ?? this.numberOfStages,
      numberOfLevels: numberOfLevels ?? this.numberOfLevels,
      type: type ?? this.type,
      pathTitle: pathTitle ?? this.pathTitle,
      pathDescription: pathDescription ?? this.pathDescription,
      currentLevel: currentLevel ?? this.currentLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imageUrl': imageUrl,
      'numberOfStages': numberOfStages,
      'numberOfLevels': numberOfLevels,
      'type': type,
      'pathTitle': pathTitle,
      'pathDescription': pathDescription,
      'currentLevel': currentLevel,
    };
  }

  factory PathModel.fromMap(Map<String, dynamic> map) {
    return PathModel(
      imageUrl: map['imageUrl'] as String,
      numberOfStages: map['numberOfStages'] as String,
      numberOfLevels: map['numberOfLevels'] as String,
      type: map['type'] as String,
      pathTitle: map['pathTitle'] as String,
      pathDescription: map['pathDescription'] as String,
      currentLevel: map['currentLevel'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PathModel.fromJson(String source) =>
      PathModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      imageUrl,
      numberOfStages,
      numberOfLevels,
      type,
      pathTitle,
      pathDescription,
      currentLevel,
    ];
  }
}
