import 'package:flutter/material.dart';

class BaziInputElemanlari extends StatefulWidget{
  const BaziInputElemanlari({super.key});

  @override
  State<BaziInputElemanlari> createState() => _BaziInputElemanlariState();
}

class _BaziInputElemanlariState extends State<BaziInputElemanlari> {

  bool checkBoxState = false;
  String sehir = "";
  bool switchState = false;
  double sliderDeger = 10;
  String secilenRenk = "Kırmızı";
  List<String> sehirler = ["Erzincan", "Izmir", "Edirne"];
  String secilenSehir = "Erzincan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){

      }, child: Icon(Icons.add_circle)),
      appBar: AppBar(
        title: Text("Bazı Input Elemanları"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            CheckboxListTile(value: checkBoxState, onChanged: (secildi){
              setState(() {
                checkBoxState = secildi!;
              });
            }, activeColor: Colors.red,
            title: Text("Checkbox Title"),
            subtitle: Text("Checkbox Subtitle"),
            secondary: Icon(Icons.add),
            selected: false),
            RadioListTile(value: "Ankara", groupValue: sehir, onChanged: (value){
              setState(() {
                sehir = value!;
                print(value.toString());
              });
            }, title: Text("Ankara"), subtitle: Text("Ankara Şehri"), secondary: Icon(Icons.map)),
            RadioListTile(value: "Bursa", groupValue: sehir, onChanged: (value){
              setState(() {
                sehir = value!;
                print(value.toString());
              });
              }, title: Text("Bursa"), subtitle: Text("Bursa Şehri"), secondary: Icon(Icons.map)),
            RadioListTile(value: "İstanbul", groupValue: sehir, onChanged: (value){
              setState(() {
                sehir = value!;
                print(value.toString());
              });
              }, title: Text("İstanbul"), subtitle: Text("İstanbul Şehri"), secondary: Icon(Icons.map)),
            SwitchListTile(value: switchState, onChanged: (deger){
              setState(() {
                switchState = deger;
                print(switchState);
              });
            }, title: Text("Switch title"),
            subtitle: Text("Switch subtitle"),
            secondary: Icon(Icons.refresh)),
            Text("Değeri slider'dan seçiniz"),
            Slider(value: sliderDeger, onChanged: (deger){
              setState(() {
                sliderDeger = deger;
              });
            }, min: 10, max: 20, divisions: 20, label: sliderDeger.toString()),
            
            DropdownButton<String>(items: [
              DropdownMenuItem(value: "Kırmızı",child: Row(
                children: [
                  Container(width: 24, height: 24, color: Colors.red, margin: EdgeInsets.only(right: 8.0)),
                  Text("Kırmızı"),
                ],
              )),
              DropdownMenuItem(value: "Mavi",child: Row(
                children: [
                  Container(width: 24, height: 24, color: Colors.blue, margin: EdgeInsets.only(right: 8.0)),
                  Text("Mavi"),
                ],
              )),
              DropdownMenuItem(value: "Yeşil",child: Row(
                children: [
                  Container(width: 24, height: 24, color: Colors.green, margin: EdgeInsets.only(right: 8.0)),
                  Text("Yeşil"),
                ],
              )),
            ], onChanged: (String? secilen){
              setState(() {
                secilenRenk = secilen!;
              });
            }, hint: Text("Renk Seç"),
            value: secilenRenk),
            DropdownButton<String>(
                items: sehirler.map((oankiSehir)=> DropdownMenuItem<String>(value: oankiSehir,child: Text(oankiSehir))).toList(),
                onChanged: (secilen){
                  setState(() {
                    secilenSehir = secilen!;
                  });
            }, value: secilenSehir)
          ],
        ),
      ),
    );
  }

  dropDownButtonSehirlerListesi() {
    return sehirler.map((oankiSehir)=> DropdownMenuItem<String>(value: oankiSehir,child: Text(oankiSehir)));
  }
}