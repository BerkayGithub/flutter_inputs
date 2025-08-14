import 'package:flutter/material.dart';

class GlobalKeyKullanimi extends StatelessWidget{
  GlobalKeyKullanimi({super.key});
  final sayacWidgetKey = GlobalKey<SayacWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Global Key Kullanımı")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Button'a basılma sayısı"),
            SayacWidget(key: sayacWidgetKey)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            sayacWidgetKey.currentState!.arttir();
          }, child: Icon(Icons.add)),
    );
  }

}

class SayacWidget extends StatefulWidget{
  const SayacWidget({super.key});

  @override
  State<SayacWidget> createState() => SayacWidgetState();
}

class SayacWidgetState extends State<SayacWidget> {
  int _sayac = 0;
  void arttir(){
    setState(() {
      _sayac++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text(_sayac.toString());
  }
}