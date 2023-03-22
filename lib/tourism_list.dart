import 'package:flutter/material.dart';
import 'package:praktikum3/detail_screen.dart';
import 'package:praktikum3/list_item.dart';
import 'package:praktikum3/model/tourism_place.dart';
import 'package:praktikum3/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';


class TourismList extends StatefulWidget{
  const TourismList({Key? key}) : super(key: key);
  @override
  _TourismListState createState() => _TourismListState();
}

class _TourismListState extends State<TourismList>{
  final List<TourismPlace> tourismPlaceList = [
    TourismPlace(
      name: 'Surabaya Submarine Monument',
      location: 'Jl Pemuda',
      imageAsset: 'assets/images/submarine.PNG',
      description: 'Museum inside a decommissioned Russian war submarine '
          'with tours & an adjacent park with cafes. Clean '
          'and well maintaned. Car park cost 10k, entrance '
          'fee 15k/person. You can see KRI Pasopati there, '
          'it is a russian whiskey class. You can also watch '
          'the video about the Indonesian Navy at the buiding '
          'beside the submarine',
      hari: 'Open Everyday',
      jam: '08.00-16.00',
      harga: 'Rp 10.000,-' ,
      galeri: [
        'assets/images/Monkasel1.jpg',
        'assets/images/Monkasel2.jpg',
        'assets/images/Monkasel3.jpeg',
      ],
    ),
    TourismPlace(
      name: 'Kelenteng Sanggar Agung',
      location: 'Kenjeran',
      imageAsset: 'assets/images/klenteng.jpg',
      hari: 'Open Everyday',
      description: 'Klenteng Sanggar Agung juga dikenal dengan '
          'sebutan KLenteng Hong San Tang. '
          'Didirikan pada tahun 1999 dan berfungsi sebagai tempat ibadah '
          'umat Tri Dharma. Klenteng inimemiliki ciri khas yaitu '
          'terdapat patung Dewi Kwan Im setinggi 20 meter dan berada di tepi laut.',
      jam: '07.00-20.00',
      harga: 'Rp 10.000,-',
      galeri: [
        'assets/images/kelenteng1.jpg',
        'assets/images/kelenteng2.jpg',
        'assets/images/kelenteng3.jpeg',
      ],
    ),
    TourismPlace(
      name: 'House of Sampoerna',
      location: 'Krembangan Utara',
      imageAsset: 'assets/images/sampoerna.jpg',
      description: 'House of Sampoerna merupakan sebuah museum kretek Indonesia '
          'yang terletak di jalan Taman Sampoerna 6, Surabaya.',
      hari: 'Open Everyday',
      jam: '09.00-18.00',
      harga: 'Gratis',
      galeri: [
        'assets/images/hos1.jpg',
        'assets/images/hos2.jpg',
        'assets/images/hos3.jpg',
      ],
    ),
    TourismPlace(
      name: 'Tugu Pahlawan',
      location: 'Alun-Alun contong',
      imageAsset: 'assets/images/tugu_pahlawan.jpg',
      description: 'Tugu Pahlawan adalah sebuah monumen '
          'yang menjadi markah tanah Kota Surabaya. '
          'Tinggi monumen ini adalah 41,15 meter '
          'dan berbentuk lingga atau paku terbalik.',
      hari: 'Senin-Jumat',
      jam:'08.00 - 16.000',
      harga: 'Rp 5000,-',
      galeri: [
        'assets/images/tupel1.jpg',
        'assets/images/tupel2.jpg',
        'assets/images/tupel3.jpg',
      ],
    ),
    TourismPlace(
      name: 'Patung Suro Boyo',
      location: 'Wonokromo',
      imageAsset: 'assets/images/suroboyo.jpg',
      description: 'Patung Sura dan Baya adalah sebuah patung yang '
          'merupakan lambang kota Surabaya. Patung ini berada di depan '
          'Kebun Binatang Surabaya. Patung ini terdiri atas dua hewan yaitu '
          'buaya dan hiu yang menjadi inspirasi nama kota Surabaya: ikan sura dan baya.',
      hari: 'Open Everyday',
      jam: '24 jam',
      harga: 'Gratis',
      galeri: [
        'assets/images/sb1.jpg',
        'assets/images/sb2.jpg',
        'assets/images/sb3.jpg',
      ],
    ),
    TourismPlace(
      name: 'Museum Bawah Tanah Surabaya',
      location: 'Jl. Gubernur Suryo No.15',
      imageAsset: 'assets/images/museum.jpg',
      description: 'Alun-alun Surabaya terbilang berbeda tidak saja menawarkan '
          'ruang terbuka cantik tapi juga ruang bawah tanah yang berfungsi sebagai galeri ',
      hari: 'Selasa-Minggu',
      jam: '09.00-19.00',
      harga: 'Rp3000,-',
      galeri: [
        'assets/images/museum1.jpg',
        'assets/images/museum2.jpg',
        'assets/images/museum3.jpg',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemBuilder: (context, index) {
        final TourismPlace place = tourismPlaceList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(place: place);
            }));
          },
          child: Consumer<DoneTourismProvider>(
              builder: (context, DoneTourismProvider data, widget){
                return ListItem(
                  place: place,
                  isDone: data.doneTourismPlaceList.contains(place),
                  onCheckboxClick: (bool? value){
                    setState(() {
                      if(value!= null){
                        value
                          ? data.doneTourismPlaceList.add(place)
                          : data.doneTourismPlaceList.remove(place);
                      };
                    });
                  },
                );
              },
          ),
        );
      },
      itemCount: tourismPlaceList.length,
    );
  }
}