import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import './bloc/cart_bloc.dart';
import '../apis/httpservice.dart';
// import 'cart_details.dart';
import '../listItems/hotel_grid_item.dart';
import '../models/hotel.dart';
import 'package:badges/badges.dart' as badges;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: const Text(
          "SE Trevel",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        // actions: [
        //   Row(
        //     children: [
        //       BlocBuilder<CartBloc, CartState>(
        //         builder: (context, cartState) {
        //           final cartCount = cartState.cartItems
        //               .fold<int>(0, (sum, item) => sum + item.quantity);

        //           return badges.Badge(
        //             badgeColor: Colors.red,
        //             position: badges.BadgePosition.bottomEnd(bottom: 1, end: 1),
        //             badgeContent: Text(
        //               cartCount.toString(),
        //               style: const TextStyle(
        //                 color: Colors.white,
        //               ),
        //             ),
        //             child: IconButton(
        //               color: Colors.white,
        //               icon: const Icon(Icons.local_mall),
        //               iconSize: 25,
        //               onPressed: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (BuildContext ctx) =>
        //                             const CartDetails()));
        //               },
        //             ),
        //           );
        //         },
        //       ),
        //       const SizedBox(
        //         width: 5,
        //       )
        //     ],
        //   )
        // ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Text(
              //   "mark",
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder<List<Hotel>>(
                  future: httpService.getHotelList(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState ==
                        ConnectionState.none) {
                      return const Center(
                        child: Text('An error occurred!'),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasData) {
                        if (snapshot.error != null) {
                          return const Center(
                            child: Text('An error occurred!'),
                          );
                        } else {
                          List<Hotel> data = snapshot.data!;
                          return GridView.builder(
                            padding: const EdgeInsets.all(4.0),
                            itemCount: data.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 400,
                              childAspectRatio: 4 / 1,
                              // crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              var hotel = data[index];
                              return HotelGridItem(
                                hotel: hotel,
                              );
                            },
                          );

                          // return BlocBuilder<CartBloc, CartState>(
                          //   builder: (context, state) {
                          //     return GridView.builder(
                          //       padding: const EdgeInsets.all(4.0),
                          //       itemCount: data.length,
                          //       shrinkWrap: true,
                          //       physics: const ScrollPhysics(),
                          //       gridDelegate:
                          //           const SliverGridDelegateWithMaxCrossAxisExtent(
                          //         maxCrossAxisExtent: 200,
                          //         childAspectRatio: 3 / 4.8,
                          //         crossAxisSpacing: 10,
                          //         mainAxisSpacing: 10,
                          //       ),
                          //       itemBuilder: (context, index) {
                          //         var product = data[index];
                          //         return HotelGridItem(
                          //           product: product,
                          //           cartBloc:
                          //               BlocProvider.of<CartBloc>(context),
                          //         );
                          //       },
                          //     );
                          //   },
                          // );
                        }
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                    return const Text("");
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
