import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_card.dart';
class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });
final List<CategoryModel> categories = const[
  CategoryModel(categoryName: "Sports", image: "assets/sports.avif"),
  CategoryModel(categoryName: "Business", image: "assets/business.avif"),
  CategoryModel(categoryName: "Entertainment", image: "assets/entertaiment.avif"),
  CategoryModel(categoryName: "General", image: "assets/general.avif"),
  CategoryModel(categoryName: "Health", image: "assets/health.avif"),
  CategoryModel(categoryName: "Science", image: "assets/science.avif"),
  CategoryModel(categoryName: "Technology", image: "assets/technology.jpeg"),
];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context,index){
            return CategoryCard(
              category: categories[index],
            );
          }
      ),
    );
  }
}
