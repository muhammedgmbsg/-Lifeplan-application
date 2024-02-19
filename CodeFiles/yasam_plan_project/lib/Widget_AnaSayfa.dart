import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yasam_plan_project/Calisma_Page.dart';
import 'package:yasam_plan_project/EtkinlikPage.dart';
import 'package:yasam_plan_project/Widget_PlanBeslenme.dart';
import 'package:yasam_plan_project/Widget_SporSayfa.dart';

class ModelRenk {
  bool renk = false;
  ModelRenk(this.renk);
}

class BoolNotifier extends StateNotifier<ModelRenk> {
  BoolNotifier() : super(ModelRenk(false));

  void Degistir() {
    state.renk = !state.renk;
    state = ModelRenk(state.renk);
  }
}

final ProviderMeAgainbool =
    StateNotifierProvider<BoolNotifier, ModelRenk>((ref) {
  return BoolNotifier();
});

final ProviderMeAgainColor = StateProvider<Color>((ref) {
  // ignore: invalid_use_of_protected_member
  if (ref.watch(ProviderMeAgainbool).renk == true) {
    return const Color.fromARGB(255, 142, 4, 167);
  } else {
    return const Color.fromARGB(255, 238, 236, 236);
  }
});

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 51, 110),
      ),
      backgroundColor: const Color.fromARGB(
          255, 248, 243, 243), //Color.fromRGBO(230, 234, 236, 1),
      body: SingleChildScrollView(
        child: Stack(children: [const Row1(), Row2(), Row3(), Row4()]),
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
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(left: 340, top: 20),
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 3), // gölgenin konumu
              ),
            ],
            shape: BoxShape.rectangle,
            color: const Color.fromARGB(255, 238, 236, 236),
          ),
          child: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.account_circle_sharp,
              size: 30,
              color: Color.fromARGB(255, 12, 51, 110),
            ),
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
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 30, left: 29, top: 88),
        child: Container(
          width: 350,
          height: 270,
          decoration: BoxDecoration(
            color: const Color.fromARGB(
                255, 238, 236, 236), //Color.fromARGB(255, 238, 238, 238),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 3), // gölgenin konumu
              ),
            ],
          ),
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(right: 130, top: 10),
              child: Text(
                'Hadi Planlamaya\nBaşlayalım',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PlanBeslenme(),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14, left: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 65,
                            decoration: const BoxDecoration(
                                color: Colors.white54, shape: BoxShape.circle),
                            child: Image.asset('images/beslenme.png',
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              'Beslenme',
                              style: GoogleFonts.titilliumWeb(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SporSayfa(),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14, left: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 65,
                            decoration: const BoxDecoration(
                                color: Colors.white54, shape: BoxShape.circle),
                            child: Image.asset(
                              'images/spor.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              'Spor',
                              style: GoogleFonts.titilliumWeb(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CalismaPage(),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14, left: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 65,
                            decoration: const BoxDecoration(
                                color: Colors.white54, shape: BoxShape.circle),
                            child: Image.asset(
                              'images/calisma.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              'Çalışma',
                              style: GoogleFonts.titilliumWeb(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EtkinlikPage(),
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14, left: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 65,
                            decoration: const BoxDecoration(
                                color: Colors.white54, shape: BoxShape.circle),
                            child: Image.asset(
                              'images/etkinlik.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              'Etkinlik',
                              style: GoogleFonts.titilliumWeb(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 14, left: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 65,
                            decoration: const BoxDecoration(
                                color: Colors.white54, shape: BoxShape.circle),
                            child: Image.asset(
                              'images/saglik.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              'Sağlık',
                              style: GoogleFonts.titilliumWeb(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 26),
              child: Container(
                width: 300,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: const Offset(0, 3), // gölgenin konumu
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8, right: 5),
                      child: Icon(
                        Icons.search_sharp,
                        color: Colors.black38,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 30,
                        child: Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: TextField(
                              controller: _controller,
                              decoration: const InputDecoration(
                                  hintText: 'Görev aratabilirsin',
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: InputBorder.none),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}

class Row3 extends StatefulWidget {
  const Row3({super.key});

  @override
  State<Row3> createState() => _Row3State();
}

class _Row3State extends State<Row3> {
  bool renk1 = false;
  bool renk2 = false;
  bool renk3 = false;
  bool renk4 = false;
  bool renk5 = false;
  bool renk6 = false;
  bool renk7 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 370, left: 30, right: 30),
      child: Container(
        width: 400,
        height: 140,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 238, 236, 236),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 3), // gölgenin konumu
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 13),
              child: Row(
                children: [
                  Text(
                    'June, 2023',
                    style: GoogleFonts.rajdhani(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      renk1 = !renk1;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: renk1 == true
                            ? Color.fromARGB(255, 41, 120, 185)
                            : const Color.fromARGB(255, 238, 236, 236),
                        borderRadius: BorderRadius.circular(10)),
                    width: 45,
                    height: 70,
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Text(
                            'MON',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '12',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      renk2 = !renk2;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: renk2 == true
                            ? Color.fromARGB(255, 41, 120, 185)
                            : const Color.fromARGB(255, 238, 236, 236),
                        borderRadius: BorderRadius.circular(10)),
                    width: 45,
                    height: 70,
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Text(
                            'TUE',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '13',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {});
                    renk3 = !renk3;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: renk3 == true
                            ? Color.fromARGB(255, 41, 120, 185)
                            : const Color.fromARGB(255, 238, 236, 236),
                        borderRadius: BorderRadius.circular(10)),
                    width: 45,
                    height: 70,
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Text(
                            'WED',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '14',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {});
                    renk4 = !renk4;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: renk4 == true
                            ? Color.fromARGB(255, 41, 120, 185)
                            : const Color.fromARGB(255, 238, 236, 236),
                        borderRadius: BorderRadius.circular(10)),
                    width: 45,
                    height: 70,
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Text(
                            'THU',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '15',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {});
                    renk5 = !renk5;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: renk5 == true
                            ? Color.fromARGB(255, 41, 120, 185)
                            : const Color.fromARGB(255, 238, 236, 236),
                        borderRadius: BorderRadius.circular(10)),
                    width: 45,
                    height: 70,
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Text(
                            'FRI',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '16',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      renk6 = !renk6;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: renk6 == true
                            ? Color.fromARGB(255, 41, 120, 185)
                            : const Color.fromARGB(255, 238, 236, 236),
                        borderRadius: BorderRadius.circular(10)),
                    width: 45,
                    height: 70,
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Text(
                            'SAT',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '17',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {});
                    renk7 = !renk7;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: renk7 == true
                            ? Color.fromARGB(255, 41, 120, 185)
                            : const Color.fromARGB(255, 238, 236, 236),
                        borderRadius: BorderRadius.circular(10)),
                    width: 45,
                    height: 70,
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          Text(
                            'SUN',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '18',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class Row4 extends StatefulWidget {
  const Row4({super.key});

  @override
  State<Row4> createState() => _Row4State();
}

class _Row4State extends State<Row4> {
  bool _renk1 = false;
  bool _renk2 = false;
  bool _renk3 = false;
  bool _renk4 = false;
  bool _renk5 = false;
  bool _renk6 = false;
  bool _renk7 = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 530, left: 5, right: 5),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 260, bottom: 13),
              child: Text(
                'Bildirimlerim',
                style: GoogleFonts.raleway(
                    textStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _renk2 = false;
                          _renk3 = false;
                          _renk4 = false;
                          _renk5 = false;
                          _renk1 = !_renk1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Beslenme'),
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _renk1
                              ? Color.fromARGB(255, 41, 120, 185)
                              : Color.fromARGB(255, 235, 232, 232),
                          border: Border.all(
                            color: Colors.black, // Çerçeve rengi
                            width: 0.3, // Çerçeve kalınlığı
                          ),
                          borderRadius:
                              BorderRadius.circular(6.0), // Kenar yuvarlatma
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _renk1 = false;
                          _renk3 = false;
                          _renk4 = false;
                          _renk5 = false;
                          _renk2 = !_renk2;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Spor'),
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _renk2
                              ? Color.fromARGB(255, 41, 120, 185)
                              : Color.fromARGB(255, 235, 232, 232),
                          border: Border.all(
                            color: Colors.black, // Çerçeve rengi
                            width: 0.3, // Çerçeve kalınlığı
                          ),
                          borderRadius:
                              BorderRadius.circular(6.0), // Kenar yuvarlatma
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _renk2 = false;
                          _renk1 = false;
                          _renk4 = false;
                          _renk5 = false;
                          _renk3 = !_renk3;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Çalışma'),
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _renk3
                              ? Color.fromARGB(255, 41, 120, 185)
                              : Color.fromARGB(255, 235, 232, 232),
                          border: Border.all(
                            color: Colors.black, // Çerçeve rengi
                            width: 0.3, // Çerçeve kalınlığı
                          ),
                          borderRadius:
                              BorderRadius.circular(6.0), // Kenar yuvarlatma
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _renk2 = false;
                          _renk3 = false;
                          _renk1 = false;
                          _renk5 = false;
                          _renk4 = !_renk4;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Etkinlik'),
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: _renk4
                              ? Color.fromARGB(255, 41, 120, 185)
                              : Color.fromARGB(255, 235, 232, 232),
                          border: Border.all(
                            color: Colors.black, // Çerçeve rengi
                            width: 0.3, // Çerçeve kalınlığı
                          ),
                          borderRadius:
                              BorderRadius.circular(6.0), // Kenar yuvarlatma
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _renk2 = false;
                          _renk3 = false;
                          _renk4 = false;
                          _renk1 = false;
                          _renk5 = !_renk5;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Sağlık'),
                        width: 80,
                        height: 28,
                        decoration: BoxDecoration(
                          color: _renk5
                              ? Color.fromARGB(255, 41, 120, 185)
                              : Color.fromARGB(255, 235, 232, 232),
                          border: Border.all(
                            color: Colors.black, // Çerçeve rengi
                            width: 0.3, // Çerçeve kalınlığı
                          ),
                          borderRadius:
                              BorderRadius.circular(6.0), // Kenar yuvarlatma
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 0),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 223, 222, 222),
                            borderRadius: BorderRadius.circular(5)),
                        width: 370,
                        height: 50,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(Icons.timer),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                '22.00',
                                style: GoogleFonts.raleway(fontSize: 19),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Container(
                                height: 50,
                                width: 263,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Bildirim 1',
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      Text('1 saat türkçe çalış'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 223, 222, 222),
                            borderRadius: BorderRadius.circular(5)),
                        width: 370,
                        height: 50,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(Icons.timer),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                '22.00',
                                style: GoogleFonts.raleway(fontSize: 19),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Container(
                                height: 50,
                                width: 263,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Bildirim 1',
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      Text('1 saat türkçe çalış'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 15),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 223, 222, 222),
                            borderRadius: BorderRadius.circular(5)),
                        width: 370,
                        height: 50,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(Icons.timer),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                '22.00',
                                style: GoogleFonts.raleway(fontSize: 19),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Container(
                                height: 50,
                                width: 263,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Bildirim 1',
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      Text('1 saat türkçe çalış'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  




/*
 InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('MON'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('11')
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text('TUE'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('12')
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(child: Text('WED')),
                      SizedBox(
                        height: 5,
                      ),
                      Text('13')
                    ],
                  ),
                  Column(
                    children: [
                      Text('THU'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('14')
                    ],
                  ),
                  Column(
                    children: [
                      Text('FRI'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('15')
                    ],
                  ),
                  Column(
                    children: [
                      Text('SUN'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('16')
                    ],
                  ),*/
