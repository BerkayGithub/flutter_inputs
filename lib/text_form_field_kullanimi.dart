import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class TextFormFieldKullanimi extends StatefulWidget{
  const TextFormFieldKullanimi({super.key});

  @override
  State<TextFormFieldKullanimi> createState() => _TextFormFieldKullanimi();

}

class _TextFormFieldKullanimi extends State<TextFormFieldKullanimi>{
  String _email='', _password='', _username='';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Form Field")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  initialValue: "",
                  decoration: InputDecoration(labelText: "Username",hintText: "Username", border: OutlineInputBorder()),
                  validator: (deger){
                    if(deger!.length < 4){
                      return "Username en az 4 karakter olmalıdır";
                    }else{
                      return null;
                    }
                  },
                  onSaved: (deger){
                    _username = deger!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  initialValue: "",
                  decoration: InputDecoration(labelText: "Email", hintText: "Email", border: OutlineInputBorder()),
                  validator: (deger){
                    if(deger!.isEmpty){
                      return "Email boş olamaz";
                    }else if(!EmailValidator.validate(deger)){
                      return "Geçerli bir email giriniz!";
                    }else {
                      return null;
                    }
                  },
                  onSaved: (deger){
                    _email = deger!;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.text,
                  initialValue: "",
                  decoration: InputDecoration(labelText: "Password", hintText: "Password", border: OutlineInputBorder()),
                  validator: (deger){
                    if(deger!.length < 6){
                      return "Şifre 6 karakterden uzun olmalıdır";
                    }else {
                      return null;
                    }
                  },
                  onSaved: (deger){
                    _password = deger!;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: (){
                      bool _validate = _formKey.currentState!.validate();
                      if(_validate){
                        _formKey.currentState!.save();
                        String message = "Email $_email\nUsername $_username\nPassword $_password";
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(backgroundColor: Colors.orange.shade300, content: Text(message, style: TextStyle(fontSize: 18)))
                        );
                        _formKey.currentState!.reset();
                      }
                    },
                    child: Text("Onayla")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}