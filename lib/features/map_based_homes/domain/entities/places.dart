import 'package:equatable/equatable.dart';

class PlacesSuggestion extends Equatable {
  final String description;
  final String placeId;

  const PlacesSuggestion({
    required this.description,
    required this.placeId,
  });

  @override
  List<Object?> get props => [
        description,
        placeId,
      ];
}
