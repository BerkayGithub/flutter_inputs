import 'package:flutter/material.dart';

class TextInputIslemleri extends StatefulWidget{
  final String title;
  const TextInputIslemleri({super.key, required this.title});

  @override
  State<TextInputIslemleri> createState() => _TextInputIslemleriState();
}

class _TextInputIslemleriState extends State<TextInputIslemleri> {

  late TextEditingController emailController;
  late FocusNode _focusNode;
  int maximumLines = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController(text: "berkay@email.com");
    _focusNode = FocusNode();
    _focusNode.addListener((){
      setState(() {
        if(_focusNode.hasFocus){
          maximumLines = 3;
        }else{
          maximumLines = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              focusNode: _focusNode,
              controller: emailController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              autofocus: true,
              maxLines: maximumLines,
              onChanged: (String deger){
                if(deger.length > 3){
                  setState(() {
                    emailController.value = TextEditingValue(
                      text: deger,
                      selection: TextSelection.collapsed(offset: deger.length)
                    );
                  });
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
              padding: EdgeInsets.all(8.0),
              child: Text(emailController.text)),
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
        setState(() {
          emailController.text = "berkaydanis@email.com";
        });
      },child: Icon(Icons.edit)),
    );
  }
}