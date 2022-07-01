import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  DetailsPage({this.heroTag, this.foodName, this.foodPrice});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'WEIGHT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 208, 0),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('Details',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
