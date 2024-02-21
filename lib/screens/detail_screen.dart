import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/hotel.dart';

class detail_screen extends StatelessWidget {
  final Hotel hotel;

  const detail_screen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          ClipRRect(
            // borderRadius: BorderRadius.circular(8),
            child: Hero(
                transitionOnUserGestures: true,
                tag: hotel.id!,
                child: CachedNetworkImage(
                  imageUrl: hotel.image!,
                  fit: BoxFit.cover,
                  width: 400,
                  height: 250,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )),
          ),
          Row(children: <Widget>[
            Icon(
              Icons.pin_drop,
              color: const Color.fromARGB(255, 26, 0, 9),
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
            Text(hotel.location),
            Text(
              "฿${hotel.price.toString()}/คืน",
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ]),
          Text(hotel.detail),
          Text(hotel.amenities[0]),
          Text(hotel.amenities[1]),
          Text(hotel.amenities[2]),
          Text(hotel.amenities[3]),
          Text(hotel.amenities[4]),
        ],
      ),
    );
  }
}
        // child: ElevatedButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: const Text('Go back!'),
        // ),
