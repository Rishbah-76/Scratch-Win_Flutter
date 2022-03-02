import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Import All the Images
  AssetImage circle = const AssetImage("images/circle.png");
  AssetImage lucky = const AssetImage("images/rupee.png");
  AssetImage unlucky = const AssetImage("images/sadFace.png");

  //Geting an Array for storing the string values
  late List<String> itemArray;
  late int luckyNumber;

  //Initializing the itemArray
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
  }

  generateRandomNumber() {
    int randomNumber = Random().nextInt(25);
    setState(() {
      luckyNumber = randomNumber;
    });
  }

  // get Image Metohd to load the images
  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case "lucky":
        return lucky;
      case "unlucky":
        return unlucky;
    }
    return circle;
  }

  //Play game Method and its all logic
  playGame(int index) {
    if (luckyNumber == index) {
      setState(() {
        itemArray[index] = "lucky";
      });
    } else {
      setState(() {
        itemArray[index] = "unlucky";
      });
    }
  }

  // Showall
  //Here we will update all the values as Unlucy and one as Lucky
  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

  // Reset the game
  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
    });
    generateRandomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scratch & Win'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: itemArray.length,
              itemBuilder: (context, i) => SizedBox(
                child: MaterialButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(i),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: () {
                this.resetGame();
              },
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Reset Game',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              color: Colors.pink,
              elevation: 12.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(style: BorderStyle.solid),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: MaterialButton(
              onPressed: () {
                this.showAll();
              },
              elevation: 12.0,
              color: Colors.pink,
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Show All',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  //decoration: TextDecoration.underline,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(style: BorderStyle.solid),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            // child: MaterialButton(
            //   onPressed: () {
            //     this.showAll();
            //   },
            //   elevation: 12.0,
            //   color: Colors.black,
            //   padding: EdgeInsets.all(5.0),
            color: Colors.black,
            child: Text(
              '@rbrishabh76',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(25.0),
            //   side: BorderSide(style: BorderStyle.solid),
            // ),
          ),
        ],
      ),
    );
  }
}
