// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SporSayfa extends StatelessWidget {
  const SporSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 231, 231),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Container(
              width: 333,
              height: 240,
              color: const Color.fromARGB(255, 53, 136, 204),
            ),
          ),
          //Beyaz Container
          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: Container(
              width: 310,
              height: 223,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 24, 24, 24)
                          .withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // gölgenin konumu
                    ),
                  ],
                  color: Colors.white),
              child: const Row1(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 320),
            child: IconButton(
                color: const Color.fromARGB(255, 240, 236, 236),
                iconSize: 50,
                onPressed: () {},
                icon: const Icon(
                  Icons.align_vertical_bottom,
                )),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 260, left: 335),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color:
                            Color.fromARGB(255, 122, 121, 121).withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 3,
                        offset: const Offset(0, 3), // gölgenin konumu
                      ),
                    ],
                    color: const Color.fromARGB(255, 53, 136, 204)),
                child: IconButton(
                    color: Color.fromARGB(255, 241, 241, 241),
                    iconSize: 35,
                    onPressed: () {},
                    icon: Icon(Icons.add_task_outlined)),
              )),
          Row2(),
        ],
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
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 34, bottom: 10),
        child: Text(
          'Kendine Uygun Olan',
          style: GoogleFonts.varela(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: const Color.fromARGB(255, 53, 136, 204)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 70),
        child: Text(
          'Aktiviteyi Ara!',
          style: GoogleFonts.varela(
              fontWeight: FontWeight.bold, fontSize: 27, color: Colors.black),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 17),
        child: Container(
          width: 260,
          height: 35,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 233, 233, 233),
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 184, 183, 183).withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 3), // gölgenin konumu
              ),
            ],
          ),
          child: const Row(
            children: [
              Expanded(
                child: Padding(
                    padding: EdgeInsets.only(bottom: 6, left: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Aktivite aratabilirsin',
                          hintStyle: TextStyle(fontSize: 12),
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
      ),
    ]);
  }
}

class Row2 extends StatefulWidget {
  const Row2({super.key});

  @override
  State<Row2> createState() => _Row2State();
}

class _Row2State extends State<Row2> {
  List<bool> Renk = [true, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 370, left: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AktiviteGrup('Hepsi', 0),
                AktiviteGrup('Fitness', 1),
                AktiviteGrup('Bireysel', 2),
                AktiviteGrup('Takım', 3)
              ],
            ),
            AktiviteIcerik(gosterge())
          ],
        ),
      ),
    );
  }

  Widget AktiviteGrup(String isim, int deger) {
    return InkWell(
      onTap: () {
        setState(() {
          for (int i = 0; i < 4; i++) {
            if (i == deger) {
              Renk[i] = true;
            } else {
              Renk[i] = false;
            }
          }
        });
      },
      child: Container(
        height: 30,
        child: Column(
          children: [
            Text(
              isim,
              style:
                  GoogleFonts.varela(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            Container(
              width: 60,
              height: 2,
              color: Renk[deger]
                  ? Colors.blue
                  : const Color.fromARGB(255, 235, 231, 231),
            )
          ],
        ),
      ),
    );
  }

  Widget AktiviteIcerik(int deger) {
    if (deger == 0) {
      return Column(
        children: [
          //BÜTÜN AKTİVİTELER BURAYA EKLENECEK
          AktiviteDetay('FullBody'),
          AktiviteDetay('Yüzme'),
          AktiviteDetay('Boks'),
          AktiviteDetay('Koşu'),

          AktiviteDetay('Bisiklet'),
          AktiviteDetay('Basketbol'),
          AktiviteDetay('Kardiyo'),
          AktiviteDetay('Jumping'),
          AktiviteDetay('Futbol'),
          AktiviteDetay('Plates'),
        ],
      );
    } else if (deger == 1) {
      //FİTNESS AKTİVİTELER BURAYA EKLENECEK
      return Column(
        children: [
          AktiviteDetay('Kardiyo'),
          AktiviteDetay('Jumping'),
          AktiviteDetay('FullBody'),
          AktiviteDetay('Plates'),
        ],
      );
    } else if (deger == 2) {
      //bİREYSEL SPORLAR BURAYA EKLENECEK
      return Column(
        children: [
          AktiviteDetay('Boks'),
          AktiviteDetay('Koşu'),
          AktiviteDetay('Yüzme'),
          AktiviteDetay('Bisiklet'),
        ],
      );
    } else if (deger == 3) {
      //tAKIM SPORLAR BURAYA EKLENECEK
      return Column(
        children: [
          AktiviteDetay('Futbol'),
          AktiviteDetay('Basketbol'),
          AktiviteDetay('Voleybol'),
          AktiviteDetay('Hentbol'),
        ],
      );
    }
    return SizedBox();
  }

  gosterge() {
    for (int i = 0; i < 4; i++) {
      if (Renk[i] == true) {
        return i;
      }
    }
  }

  Widget AktiviteDetay(
    String gorevAd,
  ) {
    return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 13),
        child: Container(
          width: 330,
          height: 170,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/$gorevAd.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(7),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 3,
                offset: const Offset(0, 3), // gölgenin konumu
              ),
            ],
            color: const Color.fromARGB(255, 230, 228, 228),
          ),
        ));
  }
}
