import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles_app.dart';
import 'package:restaurant_app/data/model/restaurant_detail_response.dart';

class DetailScreen extends StatelessWidget {
  final String _urlPicture =
      'https://restaurant-api.dicoding.dev/images/large/';

  final RestaurantDetail restaurants;
  const DetailScreen({Key? key, required this.restaurants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.6,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: colorGrey.withOpacity(0.5),
                          spreadRadius: 7,
                          blurRadius: 10,
                          offset: const Offset(0, 4))
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Hero(
                      tag: restaurants.pictureId,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              _urlPicture + restaurants.pictureId,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 80,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: colorGrey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 4))
                        ]),
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(restaurants.name),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                restaurants.city,
                                style: textWithOpacity,
                              )
                            ],
                          ),
                          Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: colorPrimary.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8)),
                              child: const FavoriteButton()),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(left: 8),
                            height: 40,
                            decoration: BoxDecoration(
                                color: colorGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              Icons.star,
                              color: iconRatings,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(10, 15, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Ratings",
                                  style: textWithOpacity,
                                ),
                                Flexible(
                                    child: Text(
                                  restaurants.rating.toString(),
                                  style: const TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(left: 8),
                            height: 40,
                            decoration: BoxDecoration(
                                color: colorGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              Icons.timer,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(10, 15, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Opening",
                                  style: textWithOpacity,
                                ),
                                const Flexible(
                                    child: Text(
                                  "10 - 12",
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(left: 8),
                            height: 40,
                            decoration: BoxDecoration(
                                color: colorGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(
                              Icons.location_pin,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(5, 15, 20, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Distance",
                                  style: textWithOpacity,
                                ),
                                const Flexible(
                                    child: Text(
                                  "4.5 KM",
                                  style: TextStyle(fontSize: 10),
                                ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: colorGrey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 4))
                ]),
            padding: const EdgeInsets.all(10.0),
            child: Card(
              margin: const EdgeInsets.all(11),
              child: Text(
                restaurants.description,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(
                  Icons.food_bank,
                  color: buttonFavorite,
                ),
                SizedBox(width: 4),
                Text("Foods"),
              ],
            ),
          ),
          listMenu(restaurants.menus.foods),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(
                  Icons.local_drink,
                  color: Colors.lightBlue,
                ),
                SizedBox(width: 4),
                Text("Drinks"),
              ],
            ),
          ),
          listMenu(restaurants.menus.drinks)
        ],
      ),
    );
  }
}

listMenu(List<dynamic> menus) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: menus.map((list) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  height: 150,
                  width: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      "https://media.istockphoto.com/photos/table-top-view-of-spicy-food-picture-id1316145932?b=1&k=20&m=1316145932&s=170667a&w=0&h=feyrNSTglzksHoEDSsnrG47UoY_XX4PtayUPpSMunQI=",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Text(list.name))
              ]);
        }).toList(),
      ),
    ),
  );
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
