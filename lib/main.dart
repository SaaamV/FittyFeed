import 'package:flutter/material.dart';
import 'package:fitty_feed_app/detailsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(
        title: '',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color(0xFFFF8C00),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ))
              ],
            ),
          ),
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Row(
              children: const <Widget>[
                Text('Fitty',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Feed',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: const EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [
                          _buildFoodItem(
                              'assets/plate1.png', 'Salmon bowl', '\$24.00'),
                          _buildFoodItem(
                              'assets/plate2.png', 'Spring bowl', '\$22.00'),
                          _buildFoodItem(
                              'assets/plate6.png', 'Avocado bowl', '\$26.00'),
                          _buildFoodItem(
                              'assets/plate5.png', 'Berry bowl', '\$24.00')
                        ]))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 65.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Icon(Icons.search, color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 65.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Center(
                        child: Icon(Icons.shopping_basket, color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 65.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xFF1C1428)),
                      child: const Center(
                          child: Text('Checkout',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 15.0))),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(
                      heroTag: imgPath, foodName: foodName, foodPrice: price)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: [
                  Hero(
                      tag: imgPath,
                      child: Image(
                          image: AssetImage(imgPath),
                          fit: BoxFit.cover,
                          height: 75.0,
                          width: 75.0)),
                  const SizedBox(width: 10.0),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(foodName,
                            style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold)),
                        Text(price,
                            style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                color: Colors.grey))
                      ])
                ]),
                IconButton(
                    icon: const Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () {})
              ],
            )));
  }
}
