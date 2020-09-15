import "package:flutter/material.dart";
import 'package:masked_text_input_formatter/masked_text_input_formatter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Myhomepage extends StatefulWidget {
  @override
  _MyhomepageState createState() => _MyhomepageState();
}

class _MyhomepageState extends State<Myhomepage> {
  TextEditingController adsoyad = TextEditingController();
  TextEditingController kredikarti = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController ayyil = TextEditingController();
  String hatakontrol = " ";
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Satın Al",
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: adsoyad,
                  decoration: InputDecoration(
                    labelText: "Ad Soyad",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  inputFormatters: [
                    MaskedTextInputFormatter(
                        mask: "xxxx-xxxx-xxxx-xxxx", separator: "-")
                  ],
                  controller: kredikarti,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Kredi Kartı",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  inputFormatters: [
                    MaskedTextInputFormatter(mask: "xxx", separator: " ")
                  ],
                  controller: cvv,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "CVV",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  inputFormatters: [
                    MaskedTextInputFormatter(mask: "MM/YY", separator: "/")
                  ],
                  controller: ayyil,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Ay Yıl",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: check,
                    onChanged: (value) {
                      setState(() {
                        check = value;
                      });
                    },
                  ),
                  Text(
                    "EULA",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  if (adsoyad.text.isEmpty) {
                    setState(() {
                      hatakontrol = "Hatalı Bilgi";
                    });
                  } else if (kredikarti.text.length < 16) {
                    setState(() {
                      hatakontrol = "Hatalı Bilgi";
                    });
                  } else if (cvv.text.length < 3) {
                    setState(() {
                      hatakontrol = "Hatalı Bilgi";
                    });
                  } else if (ayyil.text.length < 4)
                    setState(() {
                      hatakontrol = "Hatalı Bilgi";
                    });
                  else if (check == false) {
                    setState(() {
                      hatakontrol = "Kullanıcı Sözleşmesini kabul etmediniz.";
                    });
                  } else {
                    return Alert(
                      context: context,
                      title: "Ödeme",
                      desc: "Ödeme Tamamlandı!",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Tamam",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            adsoyad.clear();
                            ayyil.clear();
                            kredikarti.clear();
                            hatakontrol = " ";
                            cvv.clear();
                            setState(() {
                              check=false;
                            });
                          },
                          width: 120,
                        )
                      ],
                    ).show();
                  }
                },
                child: Text(
                  "Onayla",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  hatakontrol,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
