import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EtkinlikPage extends StatelessWidget {
  const EtkinlikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 239, 239),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 5, 5, 5).withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 3), // gölgenin konumu
                  ),
                ],
                color: Colors.purple,
              ),
              width: 600,
              height: 270,
              child: Padding(
                padding: const EdgeInsets.only(top: 62, left: 25),
                child: Text(
                  'Etkinlik Oluşturmaya\nBaşlayabilirsin',
                  style: GoogleFonts.varela(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Row1(),
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
  TextEditingController etkinlikAdCt = TextEditingController();
  TextEditingController etkinlikSureCt = TextEditingController();
  List<String> etkinlikAdList = [];
  List<String> etkinlikSureList = [];
  int _etkinlikSayi = 0;
  bool ders_Kontrol = false;
  void ekleDers() {
    setState(() {
      String etkinlikAdi = etkinlikAdCt.text;
      String etkinlikSure = etkinlikSureCt.text;
      etkinlikAdList.add(etkinlikAdi);
      etkinlikSureList.add(etkinlikSure);

      _etkinlikSayi = etkinlikAdList.length; // Update the count
      ders_Kontrol = true;
      // Close the dialog window
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 165, left: 40),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              width: 330,
              height: 330,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 5, 5, 5).withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3), // gölgenin konumu
                  ),
                ],
                color: Color.fromARGB(255, 15, 111, 190),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24, right: 140),
                    child: Text(
                      'Etkinlik Detaylarını\nGirin',
                      style: GoogleFonts.varela(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 10, right: 10),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 5, 5, 5)
                                .withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3), // gölgenin konumu
                          ),
                        ],
                        color: Color.fromARGB(255, 226, 225, 225),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          decoration: const InputDecoration(
                              hintText: 'Etkinlik girin',
                              hintStyle: TextStyle(fontSize: 12),
                              border: InputBorder.none),
                          controller: etkinlikAdCt,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, right: 205),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 5, 5, 5)
                                .withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 3), // gölgenin konumu
                          ),
                        ],
                        color: Color.fromARGB(255, 226, 225, 225),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'Süre girin/Dk',
                              hintStyle: TextStyle(fontSize: 12),
                              border: InputBorder.none),
                          controller: etkinlikSureCt,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ekleDers();
                          });
                        },
                        child: Text('Etkinliği Ekle'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(300, 44),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(15), // Köşe yuvarlama
                            ),
                            backgroundColor: Colors.white)),
                  )
                ],
              ),
            ),
          ),
          ders_Kontrol
              ? CalismaEtkinlikListe()
              : Padding(
                  padding: const EdgeInsets.only(top: 150, left: 35, right: 35),
                  child: Text(
                    'Etkinlik Bulunamadı..',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 126, 125, 125),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget CalismaEtkinlikDetay(int index) {
    if (index < etkinlikAdList.length && index < etkinlikSureList.length) {
      return Padding(
          padding:
              const EdgeInsets.only(top: 25, left: 20, bottom: 17, right: 20),
          child: Container(
            width: 290,
            height: 110,
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
                      etkinlikAdList[index],
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 17, top: 7),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      etkinlikSureList[index],
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
                            color: Colors.purple,
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
