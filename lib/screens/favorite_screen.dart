import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/components/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen(this.favoriteMeals);
  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text(
          'Nenhuma receita marcada como favorita!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
