import 'package:flutter/material.dart';
import 'package:restaurant_app/constant/constant.dart';
import 'package:restaurant_app/model/local_restaurant.dart';

class RestaurantListView extends StatelessWidget {
  const RestaurantListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    routeDetailScreen,
                    arguments: restaurants[index],
                  );
                },
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                leading: Image.network(
                  restaurants[index].pictureId,
                  width: 100,
                ),
                title: Text(
                  restaurants[index].name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'images/icon/icon_maps.png',
                          width: 13,
                          height: 13,
                          color: Colors.grey,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 3),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            restaurants[index].city,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'images/icon/icon_rate.png',
                          width: 13,
                          height: 13,
                          color: Colors.grey,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 3),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            restaurants[index].rating.toString(),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class RestaurantGridView extends StatelessWidget {
  const RestaurantGridView({super.key, required this.gridCount});

  final int gridCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      routeDetailScreen,
                      arguments: restaurants[index],
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            restaurants[index].pictureId,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            restaurants[index].name,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            children: <Widget>[
                              Image.asset(
                                'images/icon/icon_maps.png',
                                width: 13,
                                height: 13,
                                color: Colors.grey,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 3),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  restaurants[index].city,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'images/icon/icon_rate.png',
                                width: 13,
                                height: 13,
                                color: Colors.grey,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(width: 3),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  restaurants[index].rating.toString() +
                                      (restaurants[index]
                                                  .rating
                                                  .toString()
                                                  .length ==
                                              1
                                          ? ".0"
                                          : ''),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
