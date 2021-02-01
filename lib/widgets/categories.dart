import 'package:flutter/material.dart';
import 'package:food_blaze/data/providers/product_provider.dart';
import 'package:food_blaze/pages/categories_page.dart';
import 'package:food_blaze/utilities/navigation.dart';
import 'package:food_blaze/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/category_model.dart';
import 'custom_text.dart';

class Categories extends StatelessWidget {
  final List<CategoryModel> categories;

  const Categories({Key key, @required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    return Container(
      height: 100,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                await productsProvider
                    .loadProductsByCategory(categories[index].name);
                changeScreen(
                  context,
                  CategoryScreen(
                    categoryModel: categories[index],
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        offset: Offset(4, 6),
                        color: Colors.red[50],
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  child: Loading(),
                                ),
                              ),
                            ),
                            FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: categories[index].image,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: Container(
                          padding: EdgeInsets.all(4),
                          color: Colors.red,
                          child: CustomText(
                            text: categories[index].name,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
