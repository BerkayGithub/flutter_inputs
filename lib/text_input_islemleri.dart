import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputIslemleri extends StatelessWidget{
  final String title;
  const TextInputIslemleri({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofocus: true,
              onChanged: (String deger){
                if(deger.length > 3){
                  print(deger);
                }
              },
              onSubmitted: (String deger){
                print("submitted $deger");
              },
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Email Giriniz",
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.access_alarm_outlined),
                fillColor: Colors.orange,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Password"
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        
      },child: Icon(Icons.edit)),
    );
  }


}