import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  const Weight({Key? key}) : super(key: key);

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  String _selectedValu = "";
  String _selectedValue = "";
  String enteredData =  "0";
  double calcu = 0.0;
  double gToKg = 1000, kgTog= 0.001;
  _WeightState() {
    _selectedValu = _Weight[0];
    _selectedValue = _Weight[0];
  }
  List _Weight = [
    "Select Weight",
    "Killogram",
    "Gram",
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
              image: AssetImage("assets/weight.png"),
              height: 90,
              width: 90,
            ),
            SizedBox(height: 10),
            Text("Weight Converter")
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
                                items: _Weight
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
                                items: _Weight
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
                              if(_selectedValue == _Weight[1]){ //Dollor
                                if(_selectedValu == _Weight[1]){
                                  calcu = myInt;
                                }
                                else if(_selectedValu == _Weight[2]){
                                  calcu = myInt*kgTog;
                                }
                              }
                              else if(_selectedValue == _Weight[2]){ //Rupees
                                if(_selectedValu == _Weight[1]){
                                  calcu = myInt*gToKg;
                                }
                                else if(_selectedValu == _Weight[2]){
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
