import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yasam_plan_project/Widget_Kayit.dart';
import 'package:yasam_plan_project/Widget_AnaSayfa.dart';

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
    return Colors.blue;
  } else {
    return Colors.black;
  }
});

class Giris extends StatefulWidget {
  const Giris({super.key});

  @override
  State<Giris> createState() => _GirisState();
}

class _GirisState extends State<Giris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 73, 156, 224),
        body: Stack(
          children: [
            Container(
                alignment: Alignment.bottomCenter,
                width: 500,
                height: 820,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/Other.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                    width: 700,
                    height: 345,
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(33),
                          topRight: Radius.circular(33),
                          bottomLeft: Radius.circular(5)),
                    ),
                    child: const Padding(
                        padding: EdgeInsets.only(
                          top: 23,
                          left: 30,
                          right: 40,
                        ),
                        child: SingleChildScrollView(
                            child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(right: 190, bottom: 5),
                            child: Text(
                              'Tekrar Hoşgeldin',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 12, 51, 110),
                              ),
                            ),
                          ),
                          textfromUserName(),
                          textfromPassword(),
                          MeAgainInfo(),
                          buttonEnter(),
                        ]))))),
            const IconGo(),
          ],
        ));
  }
}

class IconGo extends StatelessWidget {
  const IconGo({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 440,
      left: 314,
      bottom: 90, // İkonun sola taşınması için

      child: SingleChildScrollView(
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 8,
                offset: const Offset(0, 3), // gölgenin konumu
              ),
            ],
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 12, 51, 110),
          ),
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => Kayit(),
                ));
              },
              child: const Icon(
                Icons.arrow_forward,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class textfromUserName extends StatelessWidget {
  const textfromUserName({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Kullanıcı Adı'),
    );
  }
}

class textfromPassword extends StatelessWidget {
  const textfromPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Şifre'),
      obscureText: true, //şifreli
    );
  }
}

class MeAgainInfo extends ConsumerWidget {
  const MeAgainInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 240, top: 0),
      child: TextButton(
          onPressed: () {
            ref.watch(ProviderMeAgainbool.notifier).Degistir();
          },
          child: Text('Beni Hatırla',
              style: TextStyle(
                  // ignore: invalid_use_of_protected_member
                  color: ref.watch(ProviderMeAgainColor))
              //_benihatirla),
              )),
    );
  }
}

class buttonEnter extends StatelessWidget {
  const buttonEnter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => AnaSayfa(),
            ));
          },
          child: const Text(
            'Giriş Yap',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(18), // Köşe yuvarlatma yarıçapı
            ),
            minimumSize: const Size(300, 40),
            backgroundColor: Color.fromARGB(255, 12, 51, 110),
          ),
        ),
      ),
    );
  }
}
