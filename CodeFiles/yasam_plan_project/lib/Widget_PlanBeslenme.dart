import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanBeslenme extends StatelessWidget {
  const PlanBeslenme({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(
          255, 230, 228, 228), //Color.fromRGBO(230, 234, 236, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(children: [
          Background(),
          Row1(),
          Padding(
            padding: EdgeInsets.only(left: 180, right: 150, top: 126),
            child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Saat Giriniz',
                    contentPadding: EdgeInsets.only(
                      top: 19,
                    ), // Hint metni konumunu ayarlar
                    hintStyle: TextStyle(fontSize: 13),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 0, color: Color.fromARGB(255, 161, 161, 161)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromARGB(255, 7, 38, 83),
                    )))),
          ),
          Row2(),
          Row4()
        ]),
      ),
    );
  }
}

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: 500,
      height: 130,
      decoration: const BoxDecoration(color: Color.fromARGB(255, 255, 161, 19)),
    );
  }
}

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 355, top: 100),
      child: Container(
          child: IconButton(
        iconSize: 30,
        color: Colors.blue,
        icon:
            const Icon(Icons.add_box_rounded), // Artı işaretli ikonu ekliyoruz
        onPressed: () {
          // İkon tıklandığında yapılacak işlemi burada tanımlayabilirsiniz
          print('Artı İşaretli İkona Tıklandı');
        },
      )),
    );
  }
}

class Row1 extends StatefulWidget {
  const Row1({super.key});

  @override
  State<Row1> createState() => _Row1State();
}

class _Row1State extends State<Row1> {
  String _ogundeger = 'Kahvaltı';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 90, left: 30),
        child: Container(
            decoration: BoxDecoration(
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
            height: 100,
            width: 350,
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 20),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text('Öğün Oluştur',
                        style: GoogleFonts.mPlus1(fontSize: 17)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 13, bottom: 5),
                    child: DropdownButton<String>(
                      style: const TextStyle(
                          color: Color.fromARGB(255, 48, 47, 47)),
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: const Color.fromARGB(255, 223, 222, 221),
                      value: _ogundeger, // Varsayılan değer
                      onChanged: (String? newValue) {
                        // Seçim yapıldığında tetiklenen işlev
                        setState(() {
                          _ogundeger = newValue!;
                        });
                      },
                      items: <String>[
                        'Kahvaltı',
                        'Öğle',
                        'Akşam',
                        'Ara Öğün',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ]),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 110),
                  child: FloatingActionButton(
                    onPressed: () {
                      showBlurredDialog(context);
                    },
                    backgroundColor: Colors.orange,
                    child: const Icon(
                      Icons.add_alert_sharp,
                      size: 27,
                    ),
                  )),
            ])),
      ),
    );
  }
}

class Row2 extends StatefulWidget {
  const Row2({super.key});

  @override
  State<Row2> createState() => _Row2State();
}

class _Row2State extends State<Row2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 220),
      child: Container(
        //color: Colors.red,
        height: 360,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              children: [
                ogun_add('Kahvaltı', '12.05'),
                ogun_add('Ögle', '12.05'),
                ogun_add('Kahvaltı', '12.05'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ogun_add(String ogunAdi, String saat) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 144),
            child: Text(
              ogunAdi,
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 61, 61, 61)),
            ),
          ),
          Container(
            width: 220,
            height: 300,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 235, 235),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 3), // gölgenin konumu
                  ),
                ]),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 8),
                    child: Container(
                      child:
                          Image.asset('images/ogle (2).png', fit: BoxFit.cover),
                      width: 190,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 252, 155, 9),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  besin_add('f', 1),
                  besin_add('f', 1),
                  besin_add('f', 1),
                  besin_add('f', 1),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 13, bottom: 25, left: 20),
                        child: Text(
                          '24.00',
                          style:
                              GoogleFonts.almarai(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 13, bottom: 25, left: 37),
                        child: Text(
                          'Toplam Kcal: 1200',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget besin_add(String yemek, int kcal) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text(
                '$yemek',
                style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.w300,
                    color: const Color.fromARGB(255, 77, 76, 76)),
              ),
            ),
            Stack(children: [
              const Padding(
                padding: EdgeInsets.only(left: 110, top: 15),
                child: Text('100 Kcal'),
              ),
            ])
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Divider(
            indent: 13,
            endIndent: 13,
          ),
        )
      ],
    );
  }
}

class Row4 extends StatefulWidget {
  const Row4({super.key});

  @override
  State<Row4> createState() => _Row4State();
}

class _Row4State extends State<Row4> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 608,
      ),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 80,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Kcal',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text('2200',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 243, 146, 0)),
                ),
                Container(
                  width: 80,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Boy',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text('172 cm',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 243, 146, 0)),
                ),
                Container(
                  width: 80,
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Kilo',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text('68 kg',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ],
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 243, 146, 0)),
                ),
                Container(
                  width: 80,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 243, 146, 0)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Tüketim',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text('İyi',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 77, 160, 0)))
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    minimumSize: MaterialStatePropertyAll(Size(300, 35))),
                onPressed: () {},
                child: const Text('Kaydet'),
              ),
            )
          ],
        ),
      ),
    );
  }
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
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromARGB(255, 224, 224, 224),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 3), // gölgenin konumu
                      ),
                    ],
                  ),
                  width: 500,
                  height: 400,
                  padding: const EdgeInsets.all(20.0),
                  child: FoodListScreen()),
            ),
          ),
        ),
      );
    },
  );
}

class FoodListScreen extends StatefulWidget {
  @override
  _FoodListScreenState createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  List<Map<String, dynamic>> foods = [
    {"name": "Tavada Yumurta", "calories": 220},
    {"name": "Haşlanmış Yumurta", "calories": 155},
    {"name": "Bonfile", "calories": 138},
    {"name": "Dana Kıyması", "calories": 246},
    {"name": "Hindi", "calories": 189},
    {"name": "Sığır Eti", "calories": 248},
    {"name": "Tavuk", "calories": 219},
    {"name": "Tavuk Butu", "calories": 174},
    {"name": "Tavuk Göğsü", "calories": 172},
    {"name": "Kuzu Pirzola", "calories": 276},
    {"name": "Füme Sosis", "calories": 232},
    {"name": "Sosis", "calories": 230},
    {"name": "Sucuk", "calories": 332},
    {"name": "Kızarmış Patates", "calories": 312},
    {"name": "Omlet", "calories": 154},
    {"name": "Mantı", "calories": 124},
    {"name": "Cheddar Peyniri", "calories": 403},
    {"name": "Koyun Peyniri", "calories": 364},
    {"name": "Keçi Peyniri", "calories": 364},
    {"name": "Tulum Peyniri", "calories": 363},
    {"name": "Ayran", "calories": 34},
    {"name": "Az Yağlı Süt", "calories": 35},
    {"name": "Süt", "calories": 61},
    {"name": "Sütlaç", "calories": 118},
    {"name": "Sıcak Çikolata", "calories": 89},
    {"name": "Yoğurt", "calories": 61},
    {"name": "Biber", "calories": 27},
    {"name": "Domates", "calories": 17},
    {"name": "Enginar", "calories": 47},
    {"name": "Ispanak", "calories": 23},
    {"name": "Lahana", "calories": 25},
    {"name": "Pırasa", "calories": 61},
    {"name": "Salatalık", "calories": 16},
    {"name": "Soğan", "calories": 40},
    {"name": "Zeytin", "calories": 115},
    {"name": "Yeşil Fasulye", "calories": 31},
    {"name": "Şalgam", "calories": 38},
    {"name": "Kayısı", "calories": 48},
    {"name": "Kiraz", "calories": 50},
    {"name": "Kivi", "calories": 61},
    {"name": "Elma", "calories": 52},
    {"name": "Limon", "calories": 29},
    {"name": "Nar", "calories": 83},
    {"name": "Portakal", "calories": 47},
    {"name": "Yeşil Erik", "calories": 41},
    {"name": "Çilek", "calories": 32},
    {"name": "Şeftali", "calories": 39},
    {"name": "Peynirli Pizza", "calories": 267},
    {"name": "Salamlı Pizza", "calories": 255},
    {"name": "Sucuklu Pizza", "calories": 254},
    {"name": "Tavuklu Pizza", "calories": 234},
    {"name": "Vejeteryan Pizza", "calories": 256},
    {"name": "Kıymalı Pizza", "calories": 197},
    {"name": "Capellini Makarna", "calories": 353},
    {"name": "Düdük Makarna", "calories": 370},
    {"name": "Makarna", "calories": 370},
    {"name": "Spagetti", "calories": 370},
    {"name": "Beyaz Balık", "calories": 172},
    {"name": "Kalamar", "calories": 175},
    {"name": "Istakoz", "calories": 89},
    {"name": "Midye", "calories": 172},
    {"name": "Ton Balığı", "calories": 132},
    {"name": "Barbunya Fasulyesi", "calories": 347},
    {"name": "Bezelye", "calories": 42},
    {"name": "Kırmızı Fasulye", "calories": 337},
    {"name": "Kuru Fasulye", "calories": 336},
    {"name": "Mercimek", "calories": 353},
    {"name": "Nohut", "calories": 364},
    {"name": "Yeşil Fasulye", "calories": 31},
    {"name": "Mısır Ekmeği", "calories": 179},
    {"name": "Pide", "calories": 268},
    {"name": "Sandviç", "calories": 304},
    {"name": "Su Böreği", "calories": 229},
    {"name": "Tost", "calories": 261},
    {"name": "Çörek", "calories": 316},
    {"name": "Esmer Ekmek", "calories": 250},
    {"name": "Beyaz Ekmek", "calories": 238},
    {"name": "Patates Salatası", "calories": 143},
    {"name": "Yaprak Sarması", "calories": 141},
    {"name": "Kebap", "calories": 215},
    {"name": "Karnıyarık", "calories": 134},
    {"name": "Fırında Tavuk", "calories": 164},
    {"name": "Bulgur Pilavı", "calories": 215},
    {"name": "Bezelye Çorbası", "calories": 75},
    {"name": "Domates Çorbası", "calories": 30},
    {"name": "Soğan Çorbası", "calories": 23},
    {"name": "Tavuk Çorbası", "calories": 31},
    {"name": "Mercimek Çorbası", "calories": 56},
    {"name": "Pankek", "calories": 227},
    {"name": "Tiramisu", "calories": 283},
    {"name": "Waffle", "calories": 312},
    {"name": "Çikolatalı Kek", "calories": 389},
    {"name": "Elmalı Kek", "calories": 252},
    {"name": "Havuçlu Kek", "calories": 408},
    {"name": "Çilekli Turta", "calories": 230},
    {"name": "Cheeseburger", "calories": 263},
    {"name": "Hamburger", "calories": 254},
    {"name": "Lazanya", "calories": 132},
    {"name": "Soğan Halkaları", "calories": 411},
    {"name": "Tavuk Nugget", "calories": 296},
    {"name": "Hindi", "calories": 104},
    {"name": "Cacık", "calories": 94},
    {"name": "Kuzu Ciğeri", "calories": 238},
    {"name": "Bumbar", "calories": 233},
    {"name": "Yulaf Ezmesi", "calories": 375},
    {"name": "Buğday Ezmesi", "calories": 364},
    {"name": "Zeytinyağ", "calories": 800},
    {"name": "Argan Yağı", "calories": 896},
    {"name": "Yufka", "calories": 236},
    {"name": "Armut", "calories": 57},
    {"name": "Muz", "calories": 89},
    {"name": "Çilek", "calories": 32},
    {"name": "Portakal", "calories": 43},
    {"name": "Üzüm", "calories": 69},
    {"name": "Karpuz", "calories": 30},
    {"name": "Ananas", "calories": 50},
  ];

  List<Map<String, dynamic>> filteredFoods = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredFoods.addAll(foods);
  }

  void filterFoods(String query) {
    filteredFoods.clear();
    if (query.isEmpty) {
      filteredFoods.addAll(foods);
    } else {
      filteredFoods.addAll(foods.where(
          (food) => food["name"].toLowerCase().contains(query.toLowerCase())));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Besin ekleyin',
          style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.w100,
              fontSize: 16,
              color: Color.fromARGB(255, 85, 85, 81)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            onChanged: (query) {
              filterFoods(query);
            },
            decoration: InputDecoration(
              prefixIconColor: Colors.orange,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.orange), // Aktif durumdayken alt çizgi rengi
              ),
              labelText: "Besin Ara",
              labelStyle: TextStyle(color: Color.fromARGB(255, 148, 146, 146)),
              hintText: "Besin adını girin...",
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredFoods.length,
            itemBuilder: (context, index) {
              final food = filteredFoods[index];
              return ListTile(
                title: Text(food["name"]),
                subtitle: Text("Kalori: ${food["calories"]} kcal"),
                onTap: () {
                  // Seçilen besini işle
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("${food["name"]}"),
                        content: Text(
                          "Porsiyon: 100 gr\nKalori: ${food["calories"]} kcal",
                          style:
                              GoogleFonts.varela(fontWeight: FontWeight.w300),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Besini ekle",
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
