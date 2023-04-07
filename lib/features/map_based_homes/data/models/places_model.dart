import '../../domain/entities/places.dart';

class PlacesSuggestionModel extends PlacesSuggestion {
  const PlacesSuggestionModel({
    required super.description,
    required super.placeId,
  });

  ///The 'factory' keyword is used to define a factory constructor,
  ///which is a method that returns an instance of the class
  factory PlacesSuggestionModel.fromJson(Map<String, dynamic> json) {
    return PlacesSuggestionModel(
      description: json["description"],
      placeId: json["place_id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'place_id': placeId,
    };
  }
}
