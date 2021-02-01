import 'package:flutter/material.dart';
import 'package:food_blaze/data/providers/product_provider.dart';
import 'package:food_blaze/models/restaurant_models.dart';
import 'package:food_blaze/pages/details_page.dart';
import 'package:food_blaze/utilities/navigation.dart';
import 'package:food_blaze/widgets/favourite_button.dart';
import 'package:food_blaze/widgets/product.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../widgets/custom_text.dart';
import '../widgets/loading.dart';

class RestaurantPage extends StatelessWidget {
  final RestaurantModel restaurantModel;

  const RestaurantPage({Key key, this.restaurantModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);

    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Align(
                alignment: Alignment.center,
                child: Loading(),
              )),

              // restaurant image
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child:
                    //  Image(
                    //   image: NetworkImage(restaurantModel.image),
                    // ),
                    FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: restaurantModel.image,
                  height: 160,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
              ),

              // fading black
              Container(
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.4),
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.05),
                        Colors.black.withOpacity(0.025),
                      ],
                    )),
              ),

              //restaurant name
              Positioned.fill(
                  bottom: 60,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomText(
                        text: restaurantModel.name,
                        color: Colors.white,
                        size: 26,
                        weight: FontWeight.w300,
                      ))),

              // average price
              Positioned.fill(
                  bottom: 40,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomText(
                        text: "Average Price: \$" +
                            restaurantModel.avgPrice.toString(),
                        color: Colors.white,
                        size: 18,
                        weight: FontWeight.w300,
                      ))),

              // rating widget
              Positioned.fill(
                  bottom: 2,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.star,
                                color: Colors.yellow[900],
                                size: 20,
                              ),
                            ),
                            Text(restaurantModel.rating.toString()),
                          ],
                        ),
                      ),
                    ),
                  )),

              // close button
              Positioned.fill(
                  top: 5,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.black.withOpacity(0.2)),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  )),

              //like button
              Positioned(
                  top: 6,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: GestureDetector(
                        onTap: () {},
                        child: FavouriteButton(),
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),

//              open & book section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomText(
                text: "Open",
                color: Colors.green,
                weight: FontWeight.w400,
                size: 18,
              ),
              Container(
                  child: FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.restaurant_menu),
                      label: CustomText(text: "Book Now")))
            ],
          ),

          // products
          Column(
            children: productProvider.productsByRestaurantList
                .map((item) => GestureDetector(
                      onTap: () {
                        changeScreen(
                            context,
                            DetailsPage(
                              featuredFoodModel: item,
                            ));
                      },
                      child: Product(
                        product: item,
                      ),
                    ))
                .toList(),
          )
        ],
      )),
    );
  }
}

// / import 'package:flutter/material.dart';
// import 'package:food_blaze/data/providers/product_provider.dart';
// import 'package:food_blaze/models/restaurant_models.dart';
// import 'package:provider/provider.dart';
// import 'package:transparent_image/transparent_image.dart';

// import 'favourite_button.dart';
// import 'loading.dart';

// class Restaurant extends StatelessWidget {
//   final RestaurantModel restaurant;

//   const Restaurant({Key key, this.restaurant}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductsProvider>(context);
//     return Padding(
//       padding: const EdgeInsets.only(top: 2, left: 2, right: 2, bottom: 4),
//       child: Stack(
//         children: <Widget>[
//           _backgroundImage(restaurant.image),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 FavouriteButton(),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Row(
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.all(2.0),
//                           child: Icon(
//                             Icons.star,
//                             color: Colors.yellow[900],
//                             size: 20,
//                           ),
//                         ),
//                         Text(restaurant.rating.toString()),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned.fill(
//               child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 100,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20),
//                   ),
//                   gradient: LinearGradient(
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                     colors: [
//                       Colors.black.withOpacity(0.8),
//                       Colors.black.withOpacity(0.7),
//                       Colors.black.withOpacity(0.6),
//                       Colors.black.withOpacity(0.4),
//                       Colors.black.withOpacity(0.1),
//                       Colors.black.withOpacity(0.05),
//                       Colors.black.withOpacity(0.025),
//                     ],
//                   )),
//             ),
//           )),
//           Positioned.fill(
//               child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
//                   child: RichText(
//                     text: TextSpan(children: [
//                       TextSpan(
//                           text: "${restaurant.name} \n",
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold)),
//                       TextSpan(
//                           text: "avg meal price: ",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w300)),
//                       TextSpan(
//                           text: "\$${restaurant.avgPrice} \n",
//                           style: TextStyle(fontSize: 16)),
//                     ], style: TextStyle(color: Colors.white)),
//                   ),
//                 ),
//               ],
//             ),
//           ))
//         ],
//       ),
//     );
//   }

//   Widget _backgroundImage(String image) {
//     if (image.isEmpty || image == null) {
//       return Container(
//           height: 210,
//           decoration: BoxDecoration(
//             color: Colors.grey.withOpacity(0.8),
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//           child: Center(
//             child: Image.asset(
//               "images/table.png",
//               width: 120,
//             ),
//           ));
//     } else {
//       return Padding(
//         padding: const EdgeInsets.all(0),
//         child: ClipRRect(
//             borderRadius: BorderRadius.circular(20.0),
//             child: Stack(
//               children: <Widget>[
//                 Positioned.fill(
//                     child: Align(
//                   alignment: Alignment.center,
//                   child: Container(height: 120, child: Loading()),
//                 )),
//                 Center(
//                   child: FadeInImage.memoryNetwork(
//                       placeholder: kTransparentImage, image: restaurant.image),
//                 )
//               ],
//             )),
//       );
//     }
//   }
// }
