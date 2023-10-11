import 'package:flutter/material.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({Key? key}) : super(key: key);

  @override
  _MealPlannerScreenState createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
  List<MealPlan> mealPlans = [];

  @override
  void initState() {
    super.initState();
    // Initialize the mealPlans list with some dummy data
    mealPlans = [
      MealPlan(
        day: 'Monday',
        meals: [
          Meal(mealTime: 'Breakfast', recipe: 'Avocado Toast'),
          Meal(mealTime: 'Lunch', recipe: 'Greek Salad'),
          Meal(mealTime: 'Dinner', recipe: 'Grilled Chicken with Vegetables'),
        ],
      ),
      MealPlan(
        day: 'Tuesday',
        meals: [
          Meal(mealTime: 'Breakfast', recipe: 'Oatmeal with Berries'),
          Meal(mealTime: 'Lunch', recipe: 'Caprese Sandwich'),
          Meal(mealTime: 'Dinner', recipe: 'Salmon with Quinoa'),
        ],
      ),
      // Add more meal plans for the rest of the week
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'This Week',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: mealPlans.length,
                itemBuilder: (context, index) {
                  final mealPlan = mealPlans[index];
                  return _buildMealPlanCard(mealPlan);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMealPlan,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMealPlanCard(MealPlan mealPlan) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              mealPlan.day,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteMealPlan(mealPlan),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mealPlan.meals.length,
            itemBuilder: (context, index) {
              final meal = mealPlan.meals[index];
              return _buildMealCard(meal);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMealCard(Meal meal) {
    return ListTile(
      title: Text(
        meal.mealTime,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        meal.recipe,
        style: const TextStyle(fontSize: 14),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => _deleteMeal(meal),
      ),
    );
  }

  void _addMealPlan() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController _dayController = TextEditingController();
        final TextEditingController _mealTimeController = TextEditingController();
        final TextEditingController _recipeController = TextEditingController();

        return AlertDialog(
          title: const Text('Add Meal Plan'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _dayController,
                  decoration: const InputDecoration(
                    labelText: 'Day',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _mealTimeController,
                  decoration: const InputDecoration(
                    labelText: 'Meal Time',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _recipeController,
                  decoration: const InputDecoration(
                    labelText: 'Recipe',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final newMealPlan = MealPlan(
                  day: _dayController.text,
                  meals: [
                    Meal(
                      mealTime: _mealTimeController.text,
                      recipe: _recipeController.text,
                    ),
                  ],
                );
                setState(() {
                  mealPlans.add(newMealPlan);
                });
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _deleteMealPlan(MealPlan mealPlan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Meal Plan'),
          content: const Text('Are you sure you want to delete this meal plan?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  mealPlans.remove(mealPlan);
                });
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _deleteMeal(Meal meal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Meal'),
          content: const Text('Are you sure you want to delete this meal?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  mealPlans.forEach((mealPlan) {
                    mealPlan.meals.remove(meal);
                  });
                });
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class MealPlan {
  final String day;
  final List<Meal> meals;

  MealPlan({
    required this.day,
    required this.meals,
  });
}

class Meal {
  final String mealTime;
  final String recipe;

  Meal({
    required this.mealTime,
    required this.recipe,
  });
}
