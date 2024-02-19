import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yasam_plan_project/Widget_Giris.dart';

class Kayit extends StatefulWidget {
  const Kayit({super.key});

  @override
  State<Kayit> createState() => _KayitState();
}

class _KayitState extends State<Kayit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
          backgroundColor: Color.fromARGB(255, 12, 51, 110),
        ),
        body: const Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 200, top: 80),
                    child: Text(
                      'Hesabın Yok mu ?',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 12, 51, 110),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 35, right: 40, top: 15, bottom: 7),
                    child: Column(
                      children: [
                        textfromName(),
                        textfromUserName(),
                        textfromPassword(),
                        textfromPasswordAgain()
                      ],
                    ),
                  ),
                  buttonCreate(),
                  alreadyAccount(),
                ],
              ),
            )
          ],
        ));
  }
}

class textfromName extends StatelessWidget {
  const textfromName({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(label: Text('İsim')),
    );
  }
}

class textfromUserName extends StatelessWidget {
  const textfromUserName({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(label: Text('Kullanıcı Adı')),
    );
  }
}

class textfromPassword extends StatelessWidget {
  const textfromPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(label: Text('Şifre')),
      validator: (sifre) {
        if (sifre!.length < 6) {
          return 'Şifre en az 6 karakter olmalı';
        } else {
          return null;
        }
      },
      obscureText: true,
    );
  }
}

class textfromPasswordAgain extends StatelessWidget {
  const textfromPasswordAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(label: Text('Şifre Tekrar Giriniz')),
      obscureText: true,
      validator: (sifre) {
        if (sifre!.length < 6) {
          return 'Şifre en az 6 karakter olmalı';
        } else {
          return null;
        }
      },
    );
  }
}

class buttonCreate extends StatelessWidget {
  const buttonCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23, bottom: 7),
      child: Container(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text(
            'Hesap Oluştur',
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

class alreadyAccount extends StatelessWidget {
  const alreadyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hesabın var mı ?'),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => Giris(),
              ));
            },
            child: const Text('Giriş Yap'))
      ],
    );
  }
}
