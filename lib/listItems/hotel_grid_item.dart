import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/hotel.dart';
import '../screens/detail_screen.dart';

class HotelGridItem extends StatefulWidget {
  final Hotel hotel;

  const HotelGridItem({Key? key, required this.hotel}) : super(key: key);
  // {Key? key, required this.product, required this.cartBloc})
  // : super(key: key);

  @override
  State<HotelGridItem> createState() => _HotelGridItemState();
}

class _HotelGridItemState extends State<HotelGridItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detail_screen(hotel: widget.hotel)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      child: Hero(
                          transitionOnUserGestures: true,
                          tag: widget.hotel.id!,
                          child: CachedNetworkImage(
                            imageUrl: widget.hotel.image!,
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(widget.hotel.name,
                                  // maxLines: 1,
                                  // overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                  "฿${widget.hotel.price.toString()}/คืน",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Row(
                          //   children: [
                          //     // Expanded(
                          //     //   child: Container(),
                          //     // ),
                          //     // IconButton(
                          //     //   icon: const Icon(Icons.shopping_cart),
                          //     //   color: Colors.black,
                          //     //   iconSize: 25,
                          //     //   onPressed: () {
                          //     //     widget.cartBloc.add(AddToCartEvent(widget.product, 1));
                          //     //   },
                          //     // ),
                          //   ],
                          // ),

// ClipRRect(
                // borderRadius: BorderRadius.circular(8),
                //   child: Hero(
                //       transitionOnUserGestures: true,
                //       tag: widget.hotel.id!,
                //       child: CachedNetworkImage(
                //         imageUrl: widget.hotel.image!,
                //         fit: BoxFit.cover,
                //         width: 100,
                //         height: 100,
                //         placeholder: (context, url) =>
                //             const Center(child: CircularProgressIndicator()),
                //         errorWidget: (context, url, error) =>
                //             const Icon(Icons.error),
                //       )),
                // ),