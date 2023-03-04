import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'currency.dart';
import 'tempurature.dart';
import 'lenght.dart';
import 'weight.dart';
void main(){
  runApp(Convertor());
}
class Convertor extends StatelessWidget {
  const Convertor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Currency();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple.shade700,
        animationDuration: Duration(milliseconds: 300),
        color: Colors.indigoAccent.shade100,
        onTap: (index){
          if(index == 0){
            setState(() {
              currentScreen = Currency();
              count = 0;
            });}
          else if (index == 1){
            setState(() {
              currentScreen = Tempurature();
              count = 1;
            });
          }
          else if (index == 2){
            setState(() {
              currentScreen = Lenght();
              count = 2;
            });
          }
          else if (index == 3){
            setState(() {
              currentScreen = Weight();
              count = 3;
            });
          }
        },
        items: [
          Icon(Icons.currency_exchange,color: count == 0 ? Colors.white : Colors.black,),
          Icon(Icons.thermostat,color: count == 1 ? Colors.white : Colors.black,),
          Icon(Icons.power_input,color: count == 2 ? Colors.white : Colors.black,),
          Icon(Icons.scale,color: count == 3 ? Colors.white : Colors.black,)
        ],
      ),
    );
  }
}