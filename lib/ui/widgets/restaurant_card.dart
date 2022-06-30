import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_list_response.dart';
import 'package:restaurant_app/ui/presentation/second_screen.dart';

class Cards extends StatelessWidget {
  final Restaurant restaurant;
  static const String _baseUrlImage =
      'https://restaurant-api.dicoding.dev/images/large/';
  const Cards({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SecondScreen.routeName,
            arguments: restaurant);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Hero(
                  tag: restaurant.pictureId,
                  child: Image.network(
                    _baseUrlImage + restaurant.pictureId,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 2,
                        child: Text(
                          restaurant.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                    Row(
                      children: [
                        Text(restaurant.rating),
                        const Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
