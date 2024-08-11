import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/widgets/news_list_view_builder.dart';
class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});
final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              NewsListViewBuilder(
                category: category ,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
