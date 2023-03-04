import 'package:flutter/material.dart';

class Currency extends StatefulWidget {
  const Currency({Key? key}) : super(key: key);

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  String _selectedValu = "";
  String _selectedValue = "";
  String enteredData =  "0";
  double calcu = 0.0;
  double indToUSD = 81.84, pouToUsd = 0.83;
  double usdToInd = 0.012, pouToInd = 0.010;
  double usdToPou = 1.20, indToPou = 98.25;
  _CurrencyState() {
    _selectedValu = _currency[0];
    _selectedValue = _currency[0];
  }
  List _currency = [
    "Select Currency",
    "Dollor",
    "Rupees",
    "Pounds",
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
              image: AssetImage("assets/currency.png"),
              height: 100,
              width: 100,
            ),
            Text("Currency Converter")
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
                                items: _currency
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
                                items: _currency
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
                              if(_selectedValue == _currency[1]){ //Dollor
                                if(_selectedValu == _currency[1]){
                                  calcu = myInt;
                                }
                                else if(_selectedValu == _currency[2]){
                                  calcu = myInt*usdToInd;
                                }
                                else if(_selectedValu == _currency[3]){
                                  calcu = myInt*usdToPou;
                                }
                              }
                              else if(_selectedValue == _currency[2]){ //Rupees
                                if(_selectedValu == _currency[1]){
                                  calcu = myInt*indToUSD;
                                }
                                else if(_selectedValu == _currency[2]){
                                  calcu = myInt;
                                }
                                else if(_selectedValu == _currency[3]){
                                  calcu = myInt*indToPou;
                                }
                              }
                              else if(_selectedValue == _currency[3]){ //Pounds
                                if(_selectedValu == _currency[1]){
                                  calcu = myInt*pouToUsd;
                                }
                                else if(_selectedValu == _currency[2]){
                                  calcu = myInt*pouToInd;
                                }
                                else if(_selectedValu == _currency[3]){
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
