import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class TarihSaatOrnek extends StatefulWidget{
  const TarihSaatOrnek({super.key});

  @override
  _TarihSaatOrnekState createState() => _TarihSaatOrnekState();
}

class _TarihSaatOrnekState extends State<TarihSaatOrnek>{

  @override
  Widget build(BuildContext context) {
    DateTime suan = DateTime.now();
    DateTime ucAyOncesi = DateTime(2025, suan.month-3);
    DateTime yirmiGunSonra = DateTime(2025, suan.month, suan.day+20);
    TimeOfDay suankiSaat = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(title: Text("Tarih ve Saat Kullanımı")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(foregroundColor: Colors.green),
                onPressed: (){
                  showDatePicker(context: context, firstDate: ucAyOncesi, lastDate: yirmiGunSonra).then((secilenTarih){
                    print(secilenTarih.toString());
                    print(secilenTarih?.toIso8601String());
                    print(secilenTarih?.microsecondsSinceEpoch.toString());
                    print(secilenTarih?.toUtc().toIso8601String());
                    print(formatDate(secilenTarih!, [yyyy, '-', mm, '-', dd]));
                  });
                },
                child: Text("Tarih Seç")),
            ElevatedButton(
                style: ElevatedButton.styleFrom(foregroundColor: Colors.green),
                onPressed: (){
                  showTimePicker(context: context, initialTime: suankiSaat, ).then((secilenSaat){
                    print(secilenSaat?.format(context));
                    print("${secilenSaat?.hour}:${secilenSaat?.minute}");
                  });
                },
                child: Text("Saat Seç")),
          ],
        ),
      ),
    );
  }

}