import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipepal/Utils/appcolor.dart';
import 'package:recipepal/Views/papular_recipe.dart';
import 'package:recipepal/Views/scan_recipe.dart';

import 'community_screen.dart';
import 'favorites_creen.dart';

import 'meal_planner.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  final List<String> recipeImages = [
    'https://images.pexels.com/photos/725993/pexels-photo-725993.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2673353/pexels-photo-2673353.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/262959/pexels-photo-262959.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/1117862/pexels-photo-1117862.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/13770555/pexels-photo-13770555.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2410602/pexels-photo-2410602.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2410602/pexels-photo-2410602.jpeg?auto=compress&cs=tinysrgb&w=600',
    'https://images.pexels.com/photos/2410602/pexels-photo-2410602.jpeg?auto=compress&cs=tinysrgb&w=600',
    // Add more image paths here
  ];
   final List<String> titles = [
     'Pizza Cake',
     'Chicken Fried',
     'Chicken Tikka',
     'Prata',
     'Fried Rice',
     "Mix Fried",
     "Mix Fried",
     "Mix Fried"
     // Add more image paths here
   ];
   final List<String> time = [
     '30',
     '40',
     '23',
     '15',
     '25',
     '45',
     '45',
     '45',
     // Add more image paths here
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipepal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: _CustomSearchDelegate());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColor.appColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome to Recipepal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Discover and Cook Delicious Recipes!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Get.to(HomeScreen());
                // Handle Home screen navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text(
                'Scan Recipe',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Get.to(const ScanRecipeScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text(
                'Favorites',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Get.to(FavoritesScreen());
                // Handle Favorites screen navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text(
                'Meal Planner',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Get.to(const MealPlannerScreen());
                // Handle Meal Planner screen navigation
              },
            ),


            ListTile(
              leading: const Icon(Icons.trending_up),
              title: const Text(
                'Popular Recipes',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Get.to(PopularRecipesScreen());
                // Handle Popular Recipes screen navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(
                'Community Recipes',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Get.to(CommunityPostsScreen());
                // Handle Popular Recipes screen navigation
              },
            ),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.help),
              title: const Text(
                'Help & Feedback',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {

                // Handle Help & Feedback screen navigation
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover New Recipes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: List.generate(recipeImages.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                      child: InkWell(
                        onTap: () {
                          // Handle recipe item tap
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(recipeImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    titles[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Cooking Time: ${time[index]} minutes',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // Handle favorite button tap
                              },
                              icon: Icon(Icons.favorite_border),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results view based on the query
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement search suggestions based on the query
    return Container();
  }
}
