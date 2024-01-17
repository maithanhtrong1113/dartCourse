import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frist_app/providers/user_places.dart';
import 'package:frist_app/screens/add_place.dart';
import 'package:frist_app/widgets/places_list.dart';

class Places extends ConsumerWidget {
  const Places({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Places'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddPlaceScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              // style: IconButton.styleFrom(
              //   backgroundColor: Colors.white,
              // ),
            )
          ],
        ),
        body: PlacesList(places: userPlaces),
      ),
    );
  }
}
