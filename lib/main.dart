import 'package:bilgi_yarismasi/constants.dart';
import 'package:bilgi_yarismasi/test_veri.dart';
import 'package:flutter/material.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  TestVeri test1 = TestVeri();

  void butonFonk(bool secilenButton) {
    setState(() {
      test1.getSoruYaniti() == secilenButton
          ? secimler.add(kDogruIconu)
          : secimler.add(kYanlisIconu);
      test1.SonrakiSoru();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 3,
          spacing: 3,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      color: Colors.red[400],
                      child: TextButton(
                        child: Icon(
                          color: Colors.white,
                          Icons.thumb_down,
                          size: 30.0,
                        ),
                        onPressed: () {
                          butonFonk(false);
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      color: Colors.green[400],
                      child: TextButton(
                        child: Icon(
                          Icons.thumb_up,
                          size: 30.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          butonFonk(true);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
