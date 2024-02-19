import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalismaPage extends StatelessWidget {
  const CalismaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 231, 231),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.green,
              width: 500,
              height: 85,
            ),
            const Row1(),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 70, left: 10),
              child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 20),
                child: Text(
                  'Oluşturduğun Çalışma Etkinliğini Bul!',
                  style: GoogleFonts.varela(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Row2()
          ],
        ),
      ),
    );
  }
}

class Row1 extends StatefulWidget {
  const Row1({super.key});

  @override
  State<Row1> createState() => _Row1State();
}

class _Row1State extends State<Row1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 205, left: 35, right: 67),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 5, 5, 5).withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 8,
                offset: const Offset(0, 3), // gölgenin konumu
              ),
            ],
            color: Colors.green),
        child: const Row(
          children: [
            Expanded(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 6, left: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Çalışma Etkinliğini aratabilirsin',
                        hintStyle: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 247, 247, 247)),
                        border: InputBorder.none),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 5),
              child: Icon(
                Icons.search_sharp,
                color: Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Row2 extends StatefulWidget {
  @override
  _Row2State createState() => _Row2State();
}

class _Row2State extends State<Row2> {
  final TextEditingController etkinlikAdiController = TextEditingController();
  final TextEditingController etkinlikGoreviController =
      TextEditingController();
  final TextEditingController etkinlikSuresiController =
      TextEditingController();
  List<String> etkinlikAdiList = [];
  List<String> etkinlikGoreviList = [];
  List<String> etkinlikSuresiList = [];

  int _etkinlikSayi = 0;

  void ekleDers() {
    setState(() {
      String etkinlikAdi = etkinlikAdiController.text;
      String etkinlikGorevi = etkinlikGoreviController.text;
      String etkinlikSuresi = etkinlikSuresiController.text;
      etkinlikAdiList.add(etkinlikAdi);
      etkinlikGoreviList.add(etkinlikGorevi);
      etkinlikSuresiList.add(etkinlikSuresi);
      _etkinlikSayi = etkinlikAdiList.length; // Update the count
      ders_Kontrol = true;
      Navigator.of(context).pop(); // Close the dialog window
    });
  }

  bool ders_Kontrol = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 267, left: 30, right: 180),
          child: TextButton(
            onPressed: () {
              setState(() {
                showBlurredDialog(context);
              });
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.green.shade100),
            ),
            child: Text(
              'Çalışma Etkinliği Oluştur',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.green,
              ),
            ),
          ),
        ),
        ders_Kontrol
            ? CalismaEtkinlikListe()
            : Padding(
                padding: const EdgeInsets.only(top: 150, left: 35),
                child: Text(
                  'Etkinlik Bulunamadı..',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 126, 125, 125),
                  ),
                ),
              ),
      ],
    );
  }

  showBlurredDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(255, 224, 224, 224),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  width: 500,
                  height: 400,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Etkinlik Detaylarını Ekleyin',
                        style: TextStyle(color: Colors.green),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Etkinlik Adı',
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        controller: etkinlikAdiController,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Etkinlik Görevi',
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        controller: etkinlikGoreviController,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Etkinlik Süresi/Dk',
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        controller: etkinlikSuresiController,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ekleDers();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        child: const Text(
                          'Ekle',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget CalismaEtkinlikDetay(int index) {
    if (index < etkinlikAdiList.length &&
        index < etkinlikGoreviList.length &&
        index < etkinlikSuresiList.length) {
      return Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 30, bottom: 17, right: 30),
          child: Container(
            width: 360,
            height: 114,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 24, 24, 24).withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
              color: Color.fromARGB(255, 240, 239, 239),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 15),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      etkinlikAdiList[index],
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17, top: 7),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      etkinlikGoreviList[index],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 129, 129, 129),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                    top: 7,
                  ),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.access_time_rounded,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          "${etkinlikSuresiList[index]} Dk",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 97, 97, 97),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
    } else {
      return Text("Etkinlik Bulunamadı..");
    }
  }

  Widget CalismaEtkinlikListe() {
    List<Widget> etkinlikler = [];

    for (int i = 0; i < _etkinlikSayi; i++) {
      etkinlikler.add(CalismaEtkinlikDetay(i));
    }

    return Column(children: etkinlikler);
  }
}
