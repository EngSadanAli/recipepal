import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Recipe> favoriteRecipes = [
    Recipe(
      id: 'recipe1',
      image:
      'https://images.pexels.com/photos/2703468/pexels-photo-2703468.jpeg?auto=compress&cs=tinysrgb&w=600',
      title: 'Pasta Carbonara',
      duration: '25 mins',
    ),
    Recipe(
      id: 'recipe2',
      image:
      'https://images.pexels.com/photos/674574/pexels-photo-674574.jpeg?auto=compress&cs=tinysrgb&w=600',
      title: 'Chicken Curry',
      duration: '45 mins',
    ),
    Recipe(
      id: 'recipe3',
      image:
      'https://images.pexels.com/photos/5848472/pexels-photo-5848472.jpeg?auto=compress&cs=tinysrgb&w=600',
      title: 'Vegetable Stir-Fry',
      duration: '20 mins',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          final recipe = favoriteRecipes[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.network(
                    recipe.image,
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Duration: ${recipe.duration}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            favoriteRecipes.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Recipe {
  final String id;
  final String image;
  final String title;
  final String duration;

  Recipe({
    required this.id,
    required this.image,
    required this.title,
    required this.duration,
  });
}
