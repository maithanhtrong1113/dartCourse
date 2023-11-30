import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frist_app/models/place.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);
  void addPlace(String title, File image) {
    final newPlace = Place(
      title: title,
      image: image,
      // placeLocation: placeLocation,
    );
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
