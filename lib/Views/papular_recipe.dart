import 'package:flutter/material.dart';

class PopularRecipesScreen extends StatelessWidget {
  const PopularRecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Recipes'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.85,
        ),
        itemCount: _recipeList.length,
        itemBuilder: (context, index) {
          final recipe = _recipeList[index];
          return _buildRecipeCard(recipe);
        },
      ),
    );
  }

  Widget _buildRecipeCard(Recipe recipe) {
    return GestureDetector(
      onTap: () {
        // Handle recipe tap
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  recipe.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                recipe.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Recipe {
  final String title;
  final String image;

  Recipe({
    required this.title,
    required this.image,
  });
}

final List<Recipe> _recipeList = [
  Recipe(
    title: 'Pasta Carbonara',
    image:
    'https://images.pexels.com/photos/2703468/pexels-photo-2703468.jpeg?auto=compress&cs=tinysrgb&w=600',
  ),
  Recipe(
    title: 'Chicken Curry',
    image:
    'https://images.pexels.com/photos/674574/pexels-photo-674574.jpeg?auto=compress&cs=tinysrgb&w=600',
  ),
  Recipe(
    title: 'Vegetable Stir-Fry',
    image:
    'https://images.pexels.com/photos/5848472/pexels-photo-5848472.jpeg?auto=compress&cs=tinysrgb&w=600',
  ),
  // Add more recipes
];
