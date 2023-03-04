import 'package:flutter/material.dart';

class Tempurature extends StatefulWidget {

  @override
  State<Tempurature> createState() => _TempuratureState();
}

class _TempuratureState extends State<Tempurature> {
  String _selectedValu = "";
  String _selectedValue = "";
  String enteredData =  "";
  double calcu = 0.0;
  double fehToDeg = 32, kelTocel = 273.15;
  double fehToKel = -273.15,  degToKel = -459.67;
  double degToFeh = -17.77, kelToFeh = 255.37;
  _TempuratureState() {
    _selectedValu = _tempurature[0];
    _selectedValue = _tempurature[0];
  }
  List _tempurature = [
    "Select Tempurature",
    "Celsius",
    "Fahrenheit",
    "Kelvin",
  ];
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade700,
      appBar: AppBar(
        title: Column(
          children: [
            Image(
              image: AssetImage("assets/temp.png"),
              height: 100,
              width: 100,
            ),
            Text("Tempurature Converter")
          ],
        ),
        backgroundColor: Colors.indigoAccent.shade100,
        toolbarHeight: 150,
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        scrolledUnderElevation: 20,
      ),
      body: Center(
        child: Container(
          height: 340,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.indigoAccent.shade100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 12),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        _textController.clear();
                      },
                      color: Colors.indigoAccent.shade100,
                      icon: Icon(Icons.clear),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: ' Enter value to be converted',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "From :",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,right: 10),
                          child: Center(
                            child: DropdownButton(
                                borderRadius: BorderRadius.circular(10),
                                isExpanded: true,
                                value: _selectedValu,
                                icon: Icon(Icons.arrow_drop_down_circle_sharp ,
                                  color: Colors.indigoAccent.shade100,),
                                items: _tempurature
                                    .map((e) => DropdownMenuItem(
                                    child: Text(e), value: e))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedValu = value as String;
                                  });
                                }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Text(
                      " To :",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15,right: 10),
                          child: Center(
                            child: DropdownButton(
                                borderRadius: BorderRadius.circular(10),
                                isExpanded: true,
                                value: _selectedValue,
                                icon: Icon(Icons.arrow_drop_down_circle_sharp ,
                                  color: Colors.indigoAccent.shade100,),
                                items: _tempurature
                                    .map((e) => DropdownMenuItem(
                                    child: Text(e), value: e))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedValue = value as String;
                                  });
                                }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              calcu = 0.0;
                              enteredData = _textController.text;
                              double myInt = double.parse(enteredData);
                              if(_selectedValue == _tempurature[1]){ //Celsius
                                if(_selectedValu == _tempurature[1]){
                                  calcu = myInt;
                                }
                                else if(_selectedValu == _tempurature[2]){
                                  calcu = myInt*degToFeh;
                                }
                                else if(_selectedValu == _tempurature[3]){
                                  calcu = myInt*degToKel;
                                }
                              }
                              else if(_selectedValue == _tempurature[2]){ //Rupees
                                if(_selectedValu == _tempurature[1]){
                                  calcu = myInt*fehToDeg;
                                }
                                else if(_selectedValu == _tempurature[2]){
                                  calcu = myInt;
                                }
                                else if(_selectedValu == _tempurature[3]){
                                  calcu = myInt*fehToKel;
                                }
                              }
                              else if(_selectedValue == _tempurature[3]){ //Pounds
                                if(_selectedValu == _tempurature[1]){
                                  calcu = myInt*kelTocel;
                                }
                                else if(_selectedValu == _tempurature[2]){
                                  calcu = myInt*fehToKel;
                                }
                                else if(_selectedValu == _tempurature[3]){
                                  calcu = myInt;
                                }
                              }
                            });
                          },
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_down, color: Colors.indigoAccent.shade100,size: 30,),
                              Text("Convert"),
                              Icon(Icons.arrow_drop_down, color: Colors.indigoAccent.shade100,size: 30,),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Answer :"),
                              Text(
                                "$calcu",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          ),
                        )),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
