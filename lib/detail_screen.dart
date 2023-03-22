import 'package:flutter/material.dart';
import 'package:praktikum3/model/tourism_place.dart';

class DetailScreen extends StatelessWidget{
  const DetailScreen({Key? key, required this.place}) : super(key: key);

  final TourismPlace place;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            Image.asset(place.imageAsset),
            Container( //container fot tittle
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                place.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lobster',
                ),
              ),
            ),
            Container( //Container Icon
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget> [
                      const Icon(Icons.calendar_today),
                      Text(place.hari),
                    ],
                  ),
                  Column(
                    children: <Widget> [
                      const Icon(Icons.access_time),
                      Text(place.jam),
                    ],
                  ),
                  Column(
                    children: <Widget> [
                      const Icon(Icons.paid_outlined),
                      Text(place.harga),
                    ],
                  ),
                ],
              ),
            ),
            Container( //container description
              padding: const EdgeInsets.all(16.0),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            SizedBox( //container image
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          child: Image.asset(
                            place.galeri[index],),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                    );
                  },
                  itemCount: place.galeri.length,
                ),
              ),
            ],
          ),
        ),
      );
  }
}