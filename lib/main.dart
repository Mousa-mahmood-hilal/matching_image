import 'dart:math';
import 'package:flutter/material.dart';
import '../app_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: const Text(
            'matching image',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.indigo[800],
        ),
        body: const Center(child: ImagePage()),
      ),
    );
  }
}


class ImagePage extends StatefulWidget {
  
  

  const ImagePage({super.key});

  @override
 // ignore: library_private_types_in_public_api
 _ImagePage createState() => _ImagePage();
}

class _ImagePage extends State<ImagePage> {
  int randn = 1; // Make sure to initialize your variable
  String picleft = "images/c.png";
  String picright = "images/c++.png";
  String state = "";
  String s() {
    if (picright == picleft) {
      return "images/True.png";
    }
    return "images/false.png";
  }
List pic=picture;
  // ignore: non_constant_identifier_names
  Expanded Expandedimage(String imgname,String picchanged) {
    return Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        randn = Random().nextInt(6);
                        if(picchanged=='left'){
                          picleft=pic[randn];
                        }
                        else{
                          picright=pic[randn];
                        }
                      });
                    },
                    child: Image(image: AssetImage(imgname)),
                  ),
                );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // Assuming you want to display the buttons vertically
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            picright != picleft ? 'wrong image' : 'correct image',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 42.0,
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expandedimage(picleft,'left'),
                  Expandedimage(picright,'right'),
                ],
              ),
            ),
          ),
          Expanded(flex: 1, child: Image(image: AssetImage(s()))),
          Container(
            padding: const EdgeInsets.all(15),
            child: Text(
              picright != picleft ? 'wrong image' : 'correct image',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 42.0,
              ),
            ),
          ),
        ],
      ),
    );
  }


}
