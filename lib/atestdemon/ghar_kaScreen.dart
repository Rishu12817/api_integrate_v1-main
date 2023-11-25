// import 'dart:convert';
// import 'package:api_integrate_v1/atestdemon/model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class GharKaScreen extends StatefulWidget {
//   const GharKaScreen({super.key});

//   @override
//   State<GharKaScreen> createState() => _GharKaScreenState();
// }

// class _GharKaScreenState extends State<GharKaScreen> {
//   //
//   List<Product> products = [];
//   //
//   ScrollController scrollController = ScrollController();
//   //
//   bool loading = true;
//   int limit = 10;
//   // loaded the respose forin the api
//   void ApiSeDataLayega(paraLimit) async {
//     print("this is the limit ===  $limit) ");
//     var respone = await http.get(Uri.parse(
//         "https://dummyjson.com/products?limit=$paraLimit&select=title,price,thumbnail"));
//     // if (respone.statusCode == 200) {
//     //   // success response
//     // } else {}

//     // using the model.dart to use the model. which was generated in the example at quiktype.io

//     // print(respone.body + "\n\n\n\n\n");
//     // print("--------------------------------");
//     ModelProduct modelProduct = ModelProduct.fromJson(jsonDecode(respone.body));
//     print(modelProduct.products);
//     // print("--------------------------------");
//     // print(modelProduct.skip);
//     // print("--------------------------------");
//     // print(modelProduct.total);
//     // print("--------------------------------");

//     products = modelProduct.products;
//     int setLimit = limit + 2;

//     setState(() {
//       products;
//       // products = modelProduct.products;
//       loading = false;
//       limit = setLimit;
//       print("--------------------------------");
//       print("--------------------------------");
//       print("--------------------------------");
//       print("this is the limit ===  $limit) ");
//       print("--------------------------------");
//       print("--------------------------------");
//       print("--------------------------------");
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     handlScoll();
//     ApiSeDataLayega(limit);
//   }

//   void handlScoll() {
//     // scrollController.addListener(() {
//     //   if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
//     //     ApiSeDataLayega();
//     //   }
//     // });

//     scrollController.addListener(() async {
//       if (scrollController.position.maxScrollExtent ==
//           scrollController.position.pixels) {
//         print("object is called ");
//         ApiSeDataLayega(limit);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ghar Ka Screen'),
//       ),
//       body: GridView.builder(
//         controller: scrollController,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.7,
//           mainAxisSpacing: 8.0,
//           crossAxisSpacing: 8.0,
//         ),
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           // return Column(
//           //   children: [
//           //   Image.network(products[index].thumbnail),
//           //   Text(products[index].title ),
//           //   Text(products[index].description),
//           //   ]
//           // );
//           return GestureDetector(
//             onTap: () {
//               print('Item ${products[index].id} tapped');
//               print('NAME        : ${products[index].title} ');
//               // print('Category    : ${products[index].category} ');
//               print('Price       : Rs.${products[index].price} ');
//               // print('Description:: ${products[index].descripti');

//               /// function to send item data to the cart
//             },
//             child: Card(
//               elevation: 2.0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(4.0),
//                       child: Image.network(
//                         products[index].thumbnail,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           products[index].title,
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4.0),
//                         Text(
//                           'Item Number: ${products[index].id}',
//                           style: TextStyle(fontSize: 14.0),
//                         ),
//                         SizedBox(height: 4.0),
//                         Text(
//                           '\₹ ${products[index].price.toStringAsFixed(2)}',
//                           style: TextStyle(
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         print('Add to Cart: ${products[index].title}');
//                       },
//                       child: Text('Add to Cart'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

































































































import 'package:flutter/material.dart';
import 'api_service.dart';
import 'package:api_integrate_v1/atestdemon/model.dart';

class GharKaScreen extends StatefulWidget {
  const GharKaScreen({Key? key}) : super(key: key);

  @override
  _GharKaScreenState createState() => _GharKaScreenState();
}

class _GharKaScreenState extends State<GharKaScreen> {
  //
  List<Product> products = [];
  //
  ScrollController scrollController = ScrollController();
  //
  bool loading = true;
  int limit = 10;
  
  Future<void> fetchProducts() async {
    try {
      ModelProduct modelProduct = await ApiService.fetchData(limit);
      setState(() {
        products = modelProduct.products;
        loading = false;
        limit += 2;
      });
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    handlScoll();
    fetchProducts();
  }

  void handlScoll() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        print("object is called ");
        fetchProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ghar Ka Screen'),
      ),
      body: GridView.builder(
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('Item ${products[index].id} tapped');
              print('NAME        : ${products[index].title} ');
              print('Price       : Rs.${products[index].price} ');
            },
            child: Card(
              elevation: 2.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.network(
                        products[index].thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index].title,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Item Number: ${products[index].id}',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          '\₹ ${products[index].price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        print('Add to Cart: ${products[index].title}');
                      },
                      child: Text('Add to Cart'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

