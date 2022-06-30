import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles_app.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';

class CardResult extends StatelessWidget {
  final Restaurant restaurants;
  const CardResult({Key? key, required this.restaurants}) : super(key: key);

  static const String _baseUrlImage =
      'https://restaurant-api.dicoding.dev/images/small/';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(_baseUrlImage + restaurants.pictureId),
      title: Text(restaurants.name),
      subtitle: Text(restaurants.city),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(restaurants.rating),
          const Icon(
            Icons.star,
            color: colorPrimary,
          )
        ],
      ),
    );
  }
}
