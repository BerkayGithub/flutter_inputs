import 'package:flutter/material.dart';

class StepperKullanimi extends StatefulWidget {
  const StepperKullanimi({super.key});

  @override
  State<StepperKullanimi> createState() => _StepperKullanimiState();
}

class _StepperKullanimiState extends State<StepperKullanimi> {
  int _aktifStep = 0;
  late String isim, mail, sifre;
  late List<Step> tumStepler;
  bool hata = false;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _tumStepler();

    return Scaffold(
      appBar: AppBar(title: Text("Stepper Kullanımı")),
      body: SingleChildScrollView(
        child: Stepper(
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: <Widget>[
                TextButton(onPressed: details.onStepContinue, child: const Text('NEXT')),
                TextButton(onPressed: details.onStepCancel, child: const Text('CANCEL')),
              ],
            );
          },
          steps: tumStepler,
          currentStep: _aktifStep,
          /*onStepTapped: (tappedStep){
                setState(() {
                  _aktifStep = tappedStep;
                });
            },*/
          onStepContinue: () {
            setState(() {
              _ileriButtonKontrolu();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_aktifStep > 0) {
                _aktifStep--;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("Kullanıcı adı giriniz"),
        subtitle: Text("Kullanıcı adı subtitle"),
        isActive: true,
        state: _stepleriAyarla(0),
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
            labelText: "Kullanıcı adı",
            hintText: "Kullanıcı adı hint",
            border: OutlineInputBorder(),
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return "Lütfen en az 6 karakter giriniz!";
            }
          },
          onSaved: (girilenDeger) {
            isim = girilenDeger!;
          },
        ),
      ),
      Step(
        title: Text("Mail giriniz"),
        subtitle: Text("Mail subtitle"),
        isActive: true,
        state: _stepleriAyarla(1),
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
            labelText: "Mail",
            hintText: "Mail hint",
            border: OutlineInputBorder(),
          ),
          validator: (girilenDeger) {
            if ((girilenDeger!.length < 6) || (!girilenDeger.contains("@"))) {
              return "Lütfen geçerli bir mail giriniz!";
            }
          },
          onSaved: (girilenDeger) {
            mail = girilenDeger!;
          },
        ),
      ),
      Step(
        title: Text("Şifre giriniz"),
        subtitle: Text("Şifre subtitle"),
        isActive: true,
        state: _stepleriAyarla(2),
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
            labelText: "Şifre",
            hintText: "Şifre hint",
            border: OutlineInputBorder(),
          ),
          validator: (girilenDeger) {
            if (girilenDeger!.length < 6) {
              return "Şifre en az 6 karakter olmalı!";
            }
          },
          onSaved: (girilenDeger) {
            sifre = girilenDeger!;
          },
        ),
      ),
    ];

    return stepler;
  }

  StepState _stepleriAyarla(int oankiStep) {
    if (_aktifStep == oankiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  void _ileriButtonKontrolu() {
    switch (_aktifStep) {
      case 0:
        if (key0.currentState!.validate()) {
          key0.currentState!.save();
          hata = false;
          if (_aktifStep < tumStepler.length - 1) {
            _aktifStep++;
          }
        } else {
          hata = true;
        }
        break;
      case 1:
        if (key1.currentState!.validate()) {
          key1.currentState!.save();
          hata = false;
          if (_aktifStep < tumStepler.length - 1) {
            _aktifStep++;
          }
        } else {
          hata = true;
        }
        break;
      case 2:
        if (key2.currentState!.validate()) {
          key2.currentState!.save();
          hata = false;
          _formTamamlandi();
        } else {
          hata = true;
        }
        break;
    }
  }

  void _formTamamlandi() {
    print("Kullanıcı adı:$isim,Mail:$mail,Şifre:$sifre");
  }
}
